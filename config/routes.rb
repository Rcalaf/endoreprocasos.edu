EndoreprocasosEdu::Application.routes.draw do
  #------------------------------------ADMIN--------------------------------------

      #---------------------------------SESSION------------------------------------

   match "admin" => "admin/session#login", :as => "login"

   match "admin/logout" => "admin/session#logout", :as => "logout"

   match "admin/forgot-password" => "admin/session#reset_password", :as => "reset_password"

   match "admin/forgot-password/check-email" => "admin/session#check_mail", :as => "reset_password_check_mail"

   match "admin/reset-password" => "admin/session#enter_new_password",:as => "new_password"

      #---------------------------------USERS--------------------------------------

   match "admin/users" => "admin/users#index", :as => "users"

   match "admin/user/new" => "admin/users#new", :as => "new_user"

   match "admin/user/:user_id" => "admin/users#edit", :as => "edit_user"

   match "admin/user/:user_id/delete" => "admin/users#delete", :as => "delete_user"
   
      #---------------------------------CASOS--------------------------------------
  
   match 'admin/casos' => 'admin/casos#index', :as => 'casos'
  
   match "admin/cas/nou" => "admin/casos#new", :as => "new_cas"
   
   match 'admin/cas/:cas_id' => 'admin/casos#show', :as => 'show_cas'
   
   match 'admin/cas/:cas_id/editar' => 'admin/casos#edit', :as => "edit_cas"
   
   match 'admin/cas/:cas_id/delete' => 'admin/casos#delete', :as => "delete_cas"
   
      #---------------------------------DOCUMENTS--------------------------------------
      
   match 'admin/cas/:cas_id/document/nou' => 'admin/documents#new', :as => 'new_document'
   
   match 'admin/cas/:cas_id/document/:document_id' => 'admin/documents#delete', :as => 'delete_document'
   
      #---------------------------------PREGUNTES--------------------------------------
   
   match 'admin/cas/:cas_id/pregunta/nova' => 'admin/preguntes#new', :as => 'new_pregunta'
   
   match 'admin/cas/:cas_id/pregunta/:pregunta_id' => 'admin/preguntes#edit', :as => 'edit_pregunta'
   
   match 'admin/cas/:cas_id/pregunta/:pregunta_id/eliminar' => 'admin/preguntes#delete', :as => 'delete_pregunta'
      
      #---------------------------------RESPOSTES--------------------------------------
      
   match 'admin/cas/:cas_id/pregunta/:pregunta_id/resposta/nova' => 'admin/respostes#new', :as => 'new_resposta'
   
   match 'admin/cas/:cas_id/pregunta/:pregunta_id/resposta/:resposta_id' => 'admin/respostes#edit', :as => 'edit_resposta'
   
   match 'admin/cas/:cas_id/pregunta/:pregunta_id/resposta/:resposta_id/eliminar' => 'admin/respostes#delete', :as => 'delete_resposta'
   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'admin/users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
