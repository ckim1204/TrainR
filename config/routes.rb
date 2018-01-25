Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, only: [:show, :create, :update, :destroy], path: '/users' do
		collection do
			post :sign_in, controller: 'authentication'
			post :sign_up, controller: 'authentication'
		end
	end
	resources :musclegroups, only: [:index], path: '/musclegroups'
end
