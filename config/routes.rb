Rails.application.routes.draw do
  resources :skill_categories
  resources :general_infos
  resources :experience_skills
  resources :skills
  resources :experiences
  resources :educations
  resources :dashboard


  get 'resume/index'
  get 'resume/more_skills'

  root 'resume#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
