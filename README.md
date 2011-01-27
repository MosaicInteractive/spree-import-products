Spree Import Products
==============

I've used this combination of model/controller/script to add product import functionality to a couple of projects now.
It's a fairly simple (but easy to extend), drop-in Spree extension that adds an interface to the Administration area
that allows a user to select and upload a CSV file containing information on products.

The script portion of this extension then reads the file, creating products with associated information, and
finding, attaching and saving images and taxonomies to the product object.

TODOs
==============
Adding some sort of support for running this under delayed_job is something that I think is probably reasonably
necessary for a routine like this, but not something I've had time to look into.

Also, add better support for nested taxonomies.

Apart from that, just testing really.

INSTALLATION
==============
** This extension has been converted to work with spree 0.11.x versions **

** *For spree versions > 0.30.0 go to html://github.com/joshmcarthur/spree-import-products* **
1. script/extension install git://github.com/mosaic/spree-import-products.git ('Install' the extension)
2. rake db:migrate
3. Configure the extension to suit your application by changing config variables in config/initializers/import_product_settings.rb
4. Also make sure the right columns map to what you want to import in app/models/product_import.rb
5. Run application!

ATTRIBUTION
==============
The product import script was based on a simple import script written by Brian Quinn [here](https://gist.github.com/31710). I've extended it and tweaked it to fit my needs.

Copyright (c) 2010 Josh McArthur, released under the MIT License
