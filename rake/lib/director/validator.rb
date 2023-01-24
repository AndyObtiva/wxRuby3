###
# wxRuby3 wxWidgets interface director
# Copyright (c) M.J.N. Corino, The Netherlands
###

require_relative './event_handler'

module WXRuby3

  class Director

    class Validator < EvtHandler

      def setup
        # make SWIG consider the wxRuby version
        spec.rename_class('wxValidator', 'wxRubyValidator')
        # but make sure to provide it as 'Validator' in Ruby
        spec.rename_for_ruby('wxValidator' => 'wxRubyValidator')
        # call super AFTER the renames
        super
        # provide custom wxRuby derivative of validator
        spec.add_header_code <<~__HEREDOC
          class wxRubyValidator : public wxValidator
          {
          public:
            wxRubyValidator () : wxValidator () {}
            virtual ~wxRubyValidator () {}

            // these two methods are noops in wxRuby (since we do not support C++ data transfer there) 
            // but we want them to always return true to prevent wxWidgets from complaining 
            bool TransferFromWindow () override { return true; }
            bool TransferToWindow () override { return true; }
          };
          __HEREDOC
        # will be provided as a pure Ruby method
        spec.ignore 'wxValidator::Clone'
        # not provided in Ruby
        spec.ignore %w[wxValidator::TransferFromWindow wxValidator::TransferToWindow]
      end
    end # class Validator

  end # class Director

end # module WXRuby3