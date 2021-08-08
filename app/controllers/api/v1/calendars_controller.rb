# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      include Pagy::Backend
      before_action :set_calendar_params, only: [:create]
      before_action :set_user, only: [:create]

      def index
        @pagy, @calendars = pagy(Calendar.all, items: 20, page: params[:page])
        render json: { status: 'SUCESS', data: @calendars }
      end

      def show
        calendar = Calendar.includes(stories: [resources: :events]).find(params[:id])
        render json: { status: 'SUCESS', data: calendar }
      end

      def create
        @calendar_params['user'] = @user
        calendar = Calendar.new(@calendar_params)
        if calendar.save!
          render json: { status: 'SUCESS', data: calendar }
        end
      end

      private

        def set_calendar_params
          @calendar_params = params.require(:calendar).permit(
            :name,
            stories_attributes: [
              :name,
              { resources_attributes: [
                events_attributes: %i[
                  title
                  description
                ]
              ] }
            ]
          )
        end

        def set_user
          user_id = params[:user_id]
          license_key = params[:license_key]
          @user = User.find_valid_user(user_id, license_key)
        end
    end
  end
end
