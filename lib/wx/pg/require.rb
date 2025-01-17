# Wx::PG sub package for wxRuby3
# Copyright (c) M.J.N. Corino, The Netherlands

require_relative './events'
require_relative './keyword_defs'
require_relative './property_grid_interface'
require_relative './property_grid'
require_relative './pg_property'
require_relative './pg_properties'
require_relative './pg_editor'

Wx::Dialog.setup_dialog_functors(Wx::PG)
