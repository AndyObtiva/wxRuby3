#--------------------------------------------------------------------
# @file    sizer.rb
# @author  Martin Corino
#
# @brief   wxRuby3 wxWidgets interface director
#
# @copyright Copyright (c) M.J.N. Corino, The Netherlands
#--------------------------------------------------------------------

module WXRuby3

  class Director

    class Sizer < Director

      def setup
        # Any nested sizers passed to Add() in are owned by C++, not GC'd by Ruby
        spec.disown 'wxSizer* sizer'
        case spec.module_name
        when 'wxSizer'
          spec.make_abstract('wxSizer')
          spec.ignore %w[wxSizer::IsShown wxSizer::Remove wxSizer::SetVirtualSizeHints]
          spec.add_swig_code <<~__HEREDOC
            // get rid of unwanted SWIG warning
            %warnfilter(517) wxSizer;
            // Typemap for GetChildren - convert to array of Sizer items
            %typemap(out) wxSizerItemList& {
              $result = rb_ary_new();
            
              wxSizerItemList::compatibility_iterator node = $1->GetFirst();
              while (node)
              {
                wxSizerItem *wx_si = node->GetData();
                VALUE rb_si = SWIG_NewPointerObj(wx_si, SWIGTYPE_p_wxSizerItem, 0);
                rb_ary_push($result, rb_si);
                node = node->GetNext();
              }
            }
            __HEREDOC
        when 'wxBoxSizer'
          spec.no_proxy 'wxBoxSizer::AddSpacer'
        when 'wxStaticBoxSizer'
          # Must ensure that the C++ detach method is called, else the associated
          # StaticBox will be double-freed
          spec.no_proxy(%w[
            wxStaticBoxSizer::Detach
            wxStaticBoxSizer::Remove
            wxStaticBoxSizer::Clear])
        when 'wxStdDialogButtonSizer'
        end
        spec.no_proxy 'wxBoxSizer::AddSpacer'
        super
      end
    end # class Object

  end # class Director

end # module WXRuby3
