Rails.application.routes.draw do
  resources :nationalities
  resources :student_scholarships
  resources :scholarships
  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'main' => 'users#main', :as => :main

  resources :users
  resources :student_entries
  get 'paso' => 'student_entries#paso', :as => :paso

  resources :student_academics
  resources :student_courses
  resources :courses
  resources :activities
  resources :academics
  resources :students
  get "students/show_photo/:id" => "students#show_photo"
  post 'students/activate/:id' => 'students#activate' #, :as => :activate
  root 'students#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
