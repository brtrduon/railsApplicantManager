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

  get 'recyclebin' => 'recycle#recycle'



  get 'sessions/:id' => 'sessions#destroy'
end
