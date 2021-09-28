# frozen_string_literal: true

module Api
  module V1
    class CalendarsController < ApplicationController
      include Pagy::Backend
      before_action :set_calendar_params, only: [:create]
      before_action :set_user, only: [:create]
      before_action :set_visitor, only: [:create]

      def index
        @pagy, @calendars = pagy(Calendar.includes(:user, :visitor).all, items: 20, page: params[:page])
        render json: @calendars, each_serializer: Api::V1::CalendarListSerializer, include: %i[user visitor]
      end

      def show
        calendar = Calendar.includes(stories: [resources: :events]).find(params[:id])
        render json: calendar, each_serializer: Api::V1::CalendarDetailSerializer, include: { stories: { resources: :events } }
      end

      def create
        @calendar_params['user'] = @user
        @calendar_params['visitor'] = @visitor

        calendar = Calendar.new(@calendar_params)

        if calendar.save!
          render json: calendar, each_serializer: Api::V1::CalendarDetailSerializer, include: { stories: { resources: :events } }
        else
          render json: { status: 'ERROR', data: nil }
        end
      end

      private

        def set_calendar_params
          @calendar_params = params.require(:calendar).permit(
            :name,
            stories: [
              :name,
              {
                resources: [
                  events: %i[
                    title
                    description
                  ]
                ]
              }
            ]
          ).tap{|it|
            next if it[:stories].nil?
            it[:stories].length.times do |i|
              it[:stories][i][:resources].length.times do |j|
                it[:stories][i][:resources][j][:events_attributes] = 
                  it[:stories][i][:resources][j][:events]
                it[:stories][i][:resources][j].delete :events
              end
              it[:stories][i][:resources_attributes] = it[:stories][i][:resources]
              it[:stories][i].delete :resources
            end
            it[:stories_attributes] = it[:stories]
            it.delete :stories
          }.permit!
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
