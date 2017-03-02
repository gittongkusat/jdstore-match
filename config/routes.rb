Rails.application.routes.draw do
    devise_for :users

	root 'welcome#index'

	namespace :admin do
		resources :products
		resources :orders do
			member do
				post :cancel
				post :ship
				post :shipped
				post :return
			end
		end
	end

	resources :products do
		member do
			post :add_to_cart
		end
		collection do
			get :search
		end
	end

	resources :carts do
		collection do
			delete :clean
			post :checkout
		end
	end

	resources :cart_items


	resources :orders do
		member do
			post :pay_with_alipay
			post :pay_with_wechat
			post :apply_to_cancel
		end
	end

  namespace :account do
		resources :orders
    	resources :seats
	end



    resources :products do
      resources :seats do
        member do
          post :select
          post :cancel
      end
    end
  end

	controller :pages do
		get :about
		get :test
		get :test_test
	end
   resources :welcome

   resources :products do
     resources :reviews
   end

end
