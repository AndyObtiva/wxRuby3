###
# wxRuby3 wxWidgets interface director
# Copyright (c) M.J.N. Corino, The Netherlands
###

module WXRuby3

  class Director

    class GUIEventLoop < Director

      def setup
        super
        spec.items << 'wxEventLoopBase'
        spec.gc_as_untracked
        spec.disable_proxies
        spec.make_concrete 'wxGUIEventLoop'
        spec.fold_bases 'wxGUIEventLoop' => 'wxEventLoopBase'
        spec.ignore 'wxEventLoopBase::GetActive',
                    'wxEventLoopBase::SetActive'
      end
    end # class GUIEventLoop

  end # class Director

end # module WXRuby3
