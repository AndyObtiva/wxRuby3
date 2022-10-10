# rakewx.rb
# Copyright 2004-2008, wxRuby Development Team
# released under the MIT-style wxruby3 license

require_relative './lib/director'
require 'pathname'

if $config.has_wxwidgets_xml?

  desc "(Re-)Extract all SWIG interface files (*.i) from wxWidgets XML doc files"
  task :extract do
    WXRuby3::Director.extract
  end

  $swig_targets = WXRuby3::Director.get_swig_targets

  # The plain names of all normal Wx classes to be built
  def all_build_modules
    WXRuby3::Director.all_modules - $config.feature_info.excluded_modules($config.wx_setup_h)
  end

  # The plain module names of every SWIG module (in an .i file) to be built
  def all_build
    all_build_modules + $config.helper_modules + [MAIN_MODULE]
  end

  # Every compiled object file to be linked into the final library
  def all_obj_files
    all_build.map { | f | "#{$config.obj_dir}/#{f}.#{$config.obj_ext}" }
  end

  # Every cpp file to be compiled
  def all_cpp_files
    all_build.map { | f | "#{$config.src_dir}/#{f}.cpp" }
  end

  # Every swig class that must be processed
  def all_swig_files
    $swig_targets.keys +
      $config.helper_modules.map { | mod | File.join($config.swig_dir, mod+'.i') } +
      [ 'swig/wx.i' ]
  end

  # file tasks for each generated SWIG module file
  $swig_targets.each_pair do |mod, deps|
    file File.join(mod) => deps do |t|
      WXRuby3::Director.extract(File.basename(t.name, '.i'))
    end
  end

  # Target to run the linker to create a final .so/.dll wxruby3 library
  file TARGET_LIB => all_obj_files do | t |
    objs = $config.extra_objs + " " + all_obj_files.join(' ')
    sh "#{$config.ld} #{$config.ldflags} #{objs} #{$config.libs} #{$config.link_output_flag}#{t.name}"
  end

  # The main source module - which needs to initialize all the other modules
  init_inc = File.join($config.inc_path, 'all_modules_init.inc')
  file init_inc => all_swig_files do |t|
    WXRuby3::Director.extract(genint: false)
  end
  file 'src/wx.cpp' => all_swig_files + [*WXRuby3::Director.common_dependencies['swig/wx.i'],
                                         *init_inc] do | t |
    WXRuby3::Director.generate_code('swig/wx.i', :rename, :fixmainmodule)
    File.open(t.name, "a") do | out |
      out << File.read(init_inc)
    end
  end

  # Generate cpp source from helper SWIG files - RubyConstants, Functions,
  # RubyStockObjects etc
  $config.helper_modules.each do | helper |
    swig_file = "#{$config.swig_dir}/#{helper}.i"
    file "#{$config.src_dir}/#{helper}.cpp" => [ swig_file,
                                                *$swig_targets[swig_file] ] do | _ |
      WXRuby3::Director.generate_code(swig_file, :rename, :fixmodule)
    end
  end

  # Generate a C++ source file from a SWIG .i source file for a core class
  $swig_targets.each_pair do | mod, deps |
    unless $config.helper_modules.include?(File.basename(mod, '.i'))
      file "#{$config.src_dir}/#{File.basename(mod, '.i')}.cpp" =>  mod do | _ |
        WXRuby3::Director.generate_code(mod) # default post processors
      end
    end
  end

  # Compile an object file from a generated c++ source
  cpp_src = lambda do | tn |
    tn.sub(/#{$config.obj_dir}\/(\w+)\.#{$config.obj_ext}$/) { "#{$config.src_dir}/#{$1}.cpp" }
  end

  rule ".#{$config.obj_ext}" => cpp_src do | t |
    # force_mkdir($config.obj_path)
    sh "#{$config.cpp} -c #{$config.verbose_flag} #{$config.cppflags} " +
       "#{$config.cpp_out_flag}#{t.name} #{t.source}"
  end

  desc "Install the WxRuby library to Ruby's lib directories"
  task :install => [ :default, *ALL_RUBY_LIB_FILES ] do | t |
    dest_dir = RbConfig::CONFIG['sitelibdir']
    force_mkdir File.join(dest_dir, 'wx')
    force_mkdir File.join(dest_dir, 'wx', 'classes')
    cp TARGET_LIB, RbConfig::CONFIG['sitearchdir']
    ALL_RUBY_LIB_FILES.each do | lib_file |
      dest = lib_file.sub(/^lib/, dest_dir)
      cp lib_file, dest
      chmod 0755, dest
    end
  end

  desc "Removes installed library files from site_ruby"
  task :uninstall do | t |
    rm_rf File.join(RbConfig::CONFIG['sitearchdir'],File.basename(TARGET_LIB))
    rm_rf File.join(RbConfig::CONFIG['sitelibdir'], 'wx.rb')
    rm_rf File.join(RbConfig::CONFIG['sitelibdir'], 'wx')
  end

  desc "Generate C++ source and header files using SWIG"
  task :swig   => [ $config.classes_path ] + all_cpp_files

  desc "Force generate C++ source and header files using SWIG"
  task :reswig => [ :clean_src, :swig ]

  desc 'Generate documentation for wxRuby'
  task :doc => all_swig_files do
    WXRuby3::Director.generate_docs
  end

  desc "Create a makefile"
  file "Makefile" => all_swig_files do
    object_rules = ""

    all_obj_files_and_extra_obj = all_obj_files + $config.extra_objs.split(' ')
    all_obj_files_and_extra_obj.each do | o |
      obj_no_dir = o.sub('obj/','')
      rule = "#{o}: src/#{obj_no_dir.sub('.o','.cpp')}\n\t#{$config.cpp} -c #{$config.verbose_flag} #{$config.cppflags} #{$config.cpp_out_flag}$@ $^\n\n"
      object_rules << rule
    end

    file_data = <<~__HEREDOC
      #This is generated by rake do not edit by hand!
      
      OBJ = #{all_obj_files_and_extra_obj.join(' ')}
      
      rakemake: $(OBJ)
      
      #{object_rules}
    __HEREDOC

    file = File.new("Makefile","w+")
    file.write(file_data)
  end

end
