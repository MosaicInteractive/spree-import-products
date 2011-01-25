namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(ImportProductsExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{ImportProductsExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
end

namespace :spree do
  namespace :extensions do
    namespace :import_products do
      desc "Copies public assets of the Import Products to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[ImportProductsExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(ImportProductsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end 

      desc "Copies import products config/initializers to root"
      task :config do
        source = File.join(File.dirname(__FILE__), '..', '..', 'config', 'initializers', 'import_product_settings.rb')
        destination = File.join(Rails.root, 'config', 'initializers', 'import_product_settings.rb')
        puts "INFO: Mirroring assets from #{source} to #{destination}"
        Spree::FileUtilz.mirror_files(source, destination)
      end
    end
  end
end
