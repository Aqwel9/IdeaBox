Rails.application.routes.draw do

    devise_for :users
    root 'home#index', constraints: { subdomain: /.+|^/ }

    if Rails.env.development?
        mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

    scope '/fo', module: :front_office, as: 'fo' do
        resources :ideas do
            collection do
                get :followed
            end
        end
    end


    resources :users do
        post 'follow',   to: 'socializations#follow'
        post 'unfollow', to: 'socializations#unfollow'
        post 'toggle_follow', to: 'socializations#toggle_follow'
        post 'like',   to: 'socializations#like'
        post 'unlike', to: 'socializations#unlike'
        post 'toggle_like', to: 'socializations#toggle_like'
    end

end
