RickGrundy::Application.routes.draw do  
  root :to => 'albums#index'  
  
  resources :albums do
    put :sort, :on => :collection
  end
  
  resources :photos do
    put :sort, :on => :collection
  end
  
  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
  
  match 'photo/:id/:camelized_title' => 'photos#show', :as => 'photo'
  match ':name' => 'albums#show_by_name'
end