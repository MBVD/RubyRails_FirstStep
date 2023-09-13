Rails.application.routes.draw do
  root 'posts#index'
  get 'about' => 'pages#about'
  get 'site_post/new' => "posts#new", as: :new_site_post
  get 'site_post/:id/edit' => "posts#edit", as: :edit_site_post
  patch 'site_post/:id' => 'posts#update'
  get 'site_post/:id' => 'posts#show', as: :site_post
  
  post "site_post" => "posts#create", as: :site_posts
  # as резирвирует имя site_post и дает возможность пользоваться site_post_path и site_post_url
  # resources: posts
end
