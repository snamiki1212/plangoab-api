module Api
  module V1
    class CalendarsController < ApplicationController
      include Pagy::Backend
      def index
        @pagy, @calendars = pagy(Calendar.all, items: 20, page: params[:page])
        render json: {status: "SUCESS", data: @calendars}
      end

      def show
        calendar = Calendar.includes(stories: [resources: :events]).find(params[:id])
        render json: {status: "SUCESS", data: calendar}
      end

      # def create
      #   # TODO:
      # user = User.find_valid_user(user_id, license_key)
      # calendar = Calendar.create!(user: user)
      # end

    end
  end
end