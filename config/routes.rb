Rails.application.routes.draw do
  resources :general_infos
  resources :experience_skills
  resources :skills
  resources :experiences
  resources :educations
  get 'resume/index'
  get 'resume/more_skills'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
