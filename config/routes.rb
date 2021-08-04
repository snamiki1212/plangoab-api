Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources 'calendar', only: [:index, :show, :create]
      resources 'calendars', only: [:index, :show]
    end
  end
end
