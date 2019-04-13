Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home', as: "home_route"
  get '/feeds/top' => 'feeds#top'
  get '/articles/index' => 'articles#index'
  get '/articles/rank' => 'articles#rank'
  get '/articles/stock' => 'articles#stock'

    resources :articles

    resources :feeds do
   	 member do
    	 resources :entries, only: [:index, :show, :top]
    	end
  end

    resources :users do
    get '/mypage' => 'users#mypage'
    get :autocomplete_user_email, on: :collection
  end

end
