Rails.application.routes.draw do
  get '/' => 'sessions#index'

  post '/register' => 'sessions#register'

  post '/login' => 'sessions#login'

  get '/home' => 'employees#home'

  get '/add' => 'employees#add'

  post '/add' => 'employees#create'

  get ':id' => 'employees#show'

  get 'edit/:id' => 'employees#edit'

  post 'edit/:id' => 'employees#update'

  get 'delete/:id' => 'employees#delete'

  post 'delete/:id' => 'employees#destroy'

  post 'recycle/:id' => 'employees#recycle'

  get 'home/recycle' => 'recycle#recycle'

  get 'home/recycle/delete/:id' => 'recycle#delete'

  post 'home/recycle/:id' => 'recycle#restore'

  post 'home/recycle/delete/:id' => 'recycle#destroy'

  get 'home/recycle/:id' => 'recycle#show'

  post 'home/recycle/:id/scold' => 'scolds#create'

  post 'home/recycle/:id/delete' => 'scolds#delete'



  get 'sessions/:id' => 'sessions#destroy'
end
