Rails.application.routes.draw do
  # get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#index", as: "pages"
  resources :pages do

  end

  namespace 'api' do
    namespace 'v1' do
      resources :movies do
        collection { post :import }
      end

    end
  end

end
