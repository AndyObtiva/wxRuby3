###
# wxRuby3 wxWidgets interface director
# Copyright (c) M.J.N. Corino, The Netherlands
###

module WXRuby3

  class Director

    class Region < Director

      include Typemap::PointsList

      def setup
        super
        spec.require_app 'wxRegion'
        spec.disable_proxies
        spec.gc_as_untracked
        spec.ignore 'wxNullRegion' # does not exist in code
        spec.map_apply 'int n, wxPoint points[]' => [ 'size_t, const wxPoint *']
      end
    end # class Region

  end # class Director

end # module WXRuby3
