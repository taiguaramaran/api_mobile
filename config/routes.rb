Rails.application.routes.draw do
  get 'categories/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        get 'categories/:id', to: 'categories#show'
      resources :titles do
       collection { get :index_blocked }
       collection { post :import}
       collection { post :title_name}
      end

    end
  end
  root to: "pages#home"
end
