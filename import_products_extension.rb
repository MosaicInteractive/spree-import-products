# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

#### REMOVE ####
#require 'spree_core'
#require 'import_products_hooks'
#### END REMOVE ####

class ImportProductsExtension < Spree::Extension
  version "1.0.0.11"
  description "spree_import_products ... imports products. From a CSV file via Spree's Admin interface"
  url "http://github.com/mosaic/spree-import-products"

  def self.require_gems(config)
    config.gem "fastercsv"
    config.gem "htmlentities"
  end

  def activate
    #Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
    #  Rails.env.production? ? require(c) : load(c)
    #end
  end
end
