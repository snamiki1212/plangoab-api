module Api
  module V1
    class CalendarsController < ApplicationController
      def index
        calendars = Calendar.all
        # TODO: derive visitor
        render json: {status: "SUCESS", data: calendars}
      end

      def show
        calendar = Calendar.includes(stories: [resources: :events]).find(params[:id])
        render json: {status: "SUCESS", data: calendar}
      end

      # def create
      #   # TODO:
      # end
    end
  end
end