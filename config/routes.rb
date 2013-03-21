EndoreprocasosEdu::Application.routes.draw do
  #------------------------------------ADMIN--------------------------------------

      #---------------------------------SESSION------------------------------------

   match "login" => "admin/session#login", :as => "login"

   match "logout" => "admin/session#logout", :as => "logout"

   match "forgot-password" => "admin/session#reset_password", :as => "reset_password"

   match "forgot-password/check-email" => "admin/session#check_mail", :as => "reset_password_check_mail"

   match "reset-password" => "admin/session#enter_new_password",:as => "new_password"

      #---------------------------------USERS--------------------------------------

   match "/admin/users" => "admin/users#index", :as => "users"

   match "/admin/user/new" => "admin/users#new", :as => "new_user"

   match "/admin/user/:user_id" => "admin/users#edit", :as => "edit_user"

   match "/admin/user/:user_id/delete" => "admin/users#delete", :as => "delete_user"
   
      #---------------------------------PAGES--------------------------------------

   match "pages" => "admin/pages#index", :as => "pages"

   match "admin/ page/new" => "admin/pages#new", :as => "new_page"
   
   match '/admin/pages/sort' => 'admin/pages#sort', :as => 'sort_pages'
   
   match "/admin/page/:slug" => "admin/pages#show", :as => "show_admin_page"

   match "/admin/page/:page_id/editar" => "admin/pages#edit", :as => "edit_page"

   match "/admin/page/:page_id/delete" => "admin/pages#delete", :as => "delete_page"
   
   match "page/:slug" => "front/pages#show", :as => "show_page"
  
      #---------------------------------SETTINGS-----------------------------------
    
   match '/admin/configuracion' => 'admin/settings#edit', :as => 'edit_settings'  
      
      #---------------------------------CONTENTS-----------------------------------
   
     match '/admin/contents/sort/' => 'admin/contents#sort', :as => 'sort_contents'

     match '/admin/:owner_type/:owner_id/content/new' => 'admin/contents#new', :as => 'new_content'
     
     match '/admin/:owner_type/:owner_id/content/:content_id' => 'admin/contents#edit', :as => 'edit_content'
     
     match '/admin/:owner_type/:owner_id/content/:content_id/delete/' => 'admin/contents#destroy', :as => 'delete_content'
      #---------------------------------CASOS--------------------------------------
  
   match 'casos' => 'admin/casos#index', :as => 'casos'
  
   match "/admin/cas/nou" => "admin/casos#new", :as => "new_cas"
   
   match 'cas/:cas_id' => 'admin/casos#show', :as => 'show_cas'
   
   match '/admin/cas/:cas_id/editar' => 'admin/casos#edit', :as => "edit_cas"
   
   match '/admin/cas/:cas_id/delete' => 'admin/casos#delete', :as => "delete_cas"
   
      #---------------------------------DOCUMENTS--------------------------------------
      
   match '/admin/cas/:cas_id/document/nou' => 'admin/documents#new', :as => 'new_document'
   
   match '/admin/cas/:cas_id/document/:document_id' => 'admin/documents#delete', :as => 'delete_document'
   
      #---------------------------------PREGUNTES--------------------------------------
    
   #match 'preguntes' => 'admin/preguntes#index', :as => 'preguntes'
   
   match 'cas/:cas_id/pregunta/nova' => 'admin/preguntes#new', :as => 'new_pregunta'
   
   match 'cas/:cas_id/pregunta/:pregunta_id' => 'admin/preguntes#edit', :as => 'edit_pregunta'
   
   match 'cas/:cas_id/pregunta/:pregunta_id/show' => 'admin/preguntes#show', :as => 'show_pregunta'
   
   match 'cas/:cas_id/pregunta/:pregunta_id/eliminar' => 'admin/preguntes#delete', :as => 'delete_pregunta'
      
      #---------------------------------RESPOSTES--------------------------------------
      
   match 'cas/:cas_id/pregunta/:pregunta_id/resposta/nova' => 'admin/respostes#new', :as => 'new_resposta'
   
   match 'cas/:cas_id/pregunta/:pregunta_id/resposta/:resposta_id' => 'admin/respostes#edit', :as => 'edit_resposta'
   
   match 'cas/:cas_id/pregunta/:pregunta_id/resposta/:resposta_id/eliminar' => 'admin/respostes#delete', :as => 'delete_resposta'
   
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
   root :to => 'front/pages#root'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
