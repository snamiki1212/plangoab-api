require 'rails_helper'

describe "Api::V1::CalendarController", type: :request do
  describe "Get #index" do
    before do
      FactoryBot.create_list(:calendar, 5)
    end

    subject { get api_v1_calendar_index_path }

    it 'can be sucess.' do
      subject
      expect(response.status).to eq 200
    end

    it 'should have expected numbers of list.' do
      subject
      json = JSON.parse(response.body)
      expect(json["data"].length).to eq 5
    end

  end
end