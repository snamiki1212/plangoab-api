require 'rails_helper'

describe Api::V1::CalendarsController, type: :request do
  describe "Get #index" do
    before do
      FactoryBot.create_list(:calendar, 5)
    end

    subject { get api_v1_calendars_path }

    it 'can be sucess.' do
      subject
      expect(response.status).to eq 200
    end

    it 'responds JSON.' do
      subject
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    # TODO: should not write on type: :request
    it 'responds expected numbers of list.' do
      subject
      json = JSON.parse(response.body)
      expect(json["data"].length).to eq 5
    end
  end

  describe "Get #show" do
    let!(:calendars) { FactoryBot.create_list(:calendar, 5) }
    let(:calendar) { calendars[1] }

    subject { get "#{api_v1_calendars_path}/#{calendar.id}"}

    it 'can be sucess.' do
      subject
      expect(response.status).to eq 200
    end

    it 'responds JSON.' do
      subject
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

end