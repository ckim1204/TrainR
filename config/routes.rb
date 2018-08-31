Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only: [:show, :update, :destroy], path: '/users' do
		collection do
			post 'auth/register', to: 'users#register'
			post 'auth/login', to: 'users#login'
		end
	end
	resources :musclegroups, only: [:index], path: '/musclegroups'
	resources :exercises, only: [:index], path: '/exercises'
	resources :workouts, only: [:index, :create], path: '/workouts'
end
