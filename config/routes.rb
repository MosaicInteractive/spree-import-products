map.namespace :admin do |admin|
  admin.resources :product_import, :only => [:index, :new, :create]
end
