Rails.application.routes.draw do
   

   root "pages#index"
   devise_for :users, skip: [:sessions]
   as :user do
      get 'login', to: 'pages#login', as: :new_user_session
      get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
   end

   post "/user_login", to: "login#user_login"

   
   namespace :admin do
      resources :areas
      resources :clusters
      resources :branches
      resources :employees
      resources :job_levels
      post "/create_area", to: "areas#create"
      post "/create_cluster",to: "clusters#create"
      post "/create_branch", to: "branches#create"
      post "/create_job_levels", to: "job_levels#create"
   end
 


end
