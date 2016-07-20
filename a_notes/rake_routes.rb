hermaze:~/rails_projects/hermota_fitness (master) $ rake routes

   Prefix Verb   URI Pattern               Controller#Action
   
Pages Routes   
   
        root GET    /                         pages#home
       about GET    /about(.:format)          pages#about
 member_area GET    /member_area(.:format)    pages#memberarea
 
 
Users Routes
 
     signup GET    /signup(.:format)         users#new
      users GET    /users(.:format)          users#index
            POST   /users(.:format)          users#create
  edit_user GET    /users/:id/edit(.:format) users#edit
       user GET    /users/:id(.:format)      users#show
            PATCH  /users/:id(.:format)      users#update
            PUT    /users/:id(.:format)      users#update
            DELETE /users/:id(.:format)      users#destroy
member_page GET    /member_page(.:format)    users#memberpage          
          
Sessions routes          
          
    login GET    /login(.:format)          sessions#new
          POST   /login(.:format)          sessions#create
   logout DELETE /logout(.:format)         sessions#destroy