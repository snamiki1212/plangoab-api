# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      include Pagy::Backend
      before_action :set_calendar_params, only: [:create]
      before_action :set_user, only: [:create]
      before_action :set_visitor, only: [:create]

      def index
        @pagy, @calendars = pagy(Calendar.all, items: 20, page: params[:page])
        render json: @calendars, each_serializer: Api::V1::CalendarListSerializer
      end

      def show
        calendar = Calendar.includes(stories: [resources: :events]).find(params[:id])
        render json: calendar, each_serializer: Api::V1::CalendarSerializer
      end

      def create
        @calendar_params['user'] = @user
        @calendar_params['visitor'] = @visitor
        calendar = Calendar.new(@calendar_params)

        if calendar.save!
          render json: calendar, each_serializer: Api::V1::CalendarSerializer
        else
          render json: { status: 'ERROR', data: nil }
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

        def set_visitor
          birthday = params[:birthday]
          @visitor = Visitor.new(birthday: birthday)
        end
    end
  end
end
