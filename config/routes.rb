Rails.application.routes.draw do
    get 'tops/main'
    post 'tops/login'
    root 'tops#main'
    get 'tops/logout'
end
