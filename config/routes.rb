ActionController::Routing::Routes.draw do |map|
  # Rotas simples
  map.resources :information_categories

  map.resources :issue_statuses

  map.resources :opportunity_statuses

  map.resources :interaction_types

  map.resources :products

  map.resource :session
  
  # Rotas aninhadas
  map.resources :people, :shallow => true do |people|
    people.resources :contact_forms, :except => ['index', 'show'] do |contact_forms|
      contact_forms.resource :contact_type
    end
  end
  
  map.resources :users, :shallow => true do |users|
    users.resource :address
  end
  
  map.resources :accounts, :shallow => true, :except => ["index"] do |accounts|
    accounts.resource :address
    accounts.resources :facts, :except => ["show", "index"]
    accounts.resources :phones, :except => ["show", "index"]
    accounts.resources :opportunities do |opportunities|
      opportunities.resources :interactions do |interactions|
        interactions.resources  :notes
      end
      opportunities.resources :issues do |issues|
        issues.resources :notes, :only => ["new", "create"]
      end
    end
  end
  
  # Rotas manuais
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.home '/home', :controller => 'home', :action => 'index'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  # Rota padrão
  map.root :controller => 'home', :action => 'index'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # Rotas para fins de teste. Remover quando for pra produção.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
