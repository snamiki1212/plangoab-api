module Api
  module V1
    class CalendarController < ApplicationController
      def index
        calendars = Calendar.all()
        # TODO: derive visitor
        render json: {status: "SUCESS", data: calendars}
      end

      # def show
      #   calendar = Calendar.find(params[:id])
      #   # TODO: derive all calendar's children
      #   render json: {status: "SUCESS", data: calendar}
      # end

      # def create
      #   # TODO:
      # end
    end
  end
end