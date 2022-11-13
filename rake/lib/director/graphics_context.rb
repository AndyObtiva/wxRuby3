#--------------------------------------------------------------------
# @file    graphics_context.rb
# @author  Martin Corino
#
# @brief   wxRuby3 wxWidgets interface director
#
# @copyright Copyright (c) M.J.N. Corino, The Netherlands
#--------------------------------------------------------------------

module WXRuby3

  class Director

    class GraphicsContext < Director

      def setup
        super
        spec.disable_proxies
        spec.ignore 'wxGraphicsContext::CreateFromNative',
                    'wxGraphicsContext::CreateFromNativeWindow',
                    'wxGraphicsContext::CreateFromNativeHDC',
                    'wxGraphicsContext::Create(const wxEnhMetaFileDC &)'
        # type mappings
        spec.add_swig_code <<~__HEREDOC
          // Typemap to fix GraphicsContext#get_text_extent
          %apply double *OUTPUT { wxDouble* width, wxDouble* height, 
                                  wxDouble* descent, wxDouble* externalLeading }
          
          %typemap(directorargout) ( wxDouble* width, wxDouble* height, 
                                     wxDouble* descent, wxDouble* externalLeading) {
            if ( (TYPE(result) == T_ARRAY) && (RARRAY_LEN(result) >= 2) )
              {
                *$1 = ($*1_ltype)NUM2INT(rb_ary_entry(result,0));
                *$2 = ($*2_ltype)NUM2INT(rb_ary_entry(result,1));
                if ( ($3 != NULL ) && RARRAY_LEN(result) >= 3)
                  *$3 = ($*3_ltype)NUM2INT(rb_ary_entry(result,2));
                if ( ( $4 != NULL ) && RARRAY_LEN(result) >= 4 )
                  *$4 = ($*4_ltype)NUM2INT(rb_ary_entry(result,3));
              }
          }
          __HEREDOC
      end
    end # class GraphicsContext

  end # class Director

end # module WXRuby3