Rails.application.routes.draw do
    root 'static_pages#home'
    
    get 'static_pages/home'

    # get 'auth/:provider/callback', to: 'sessions#create'
    # get 'auth/failure',            to: redirect('/')
    # get 'signout',                 to: 'sessions#destroy', as: 'signout'

    resources :events, only: [:index, :new, :create, :show, :destroy]
    resources :users, only: [:new, :create, :show]
    
    get '/signup', to: 'users#new'
    
    get '/login',       to: 'sessions#new'
    post '/login',      to: 'sessions#create'
    delete '/logout',   to: 'sessions#destroy'
    
    get '/past_events',            to: 'events#past_events'
    patch 'attend/event/:id',      to: 'events#attend', as: :attend_event
    patch 'unattend/event/:id',    to: 'events#unattend', as: :unattend_event
    
    get '/search',                 to: 'events#search'

end
