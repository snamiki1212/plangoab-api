require 'rails_helper'

describe Api::V1::CalendarsController, type: :request do
  describe "GET #index" do
    before do
      FactoryBot.create_list(:calendar, 21)
    end

    subject { get api_v1_calendars_path }
    let(:subject_next_page) { get "#{api_v1_calendars_path}?page=2" }

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
      expect(json["data"].length).to eq 20

      subject_next_page
      json = JSON.parse(response.body)
      expect(json["data"].length).to eq 1
    end
  end

  describe "GET #show" do
    let!(:calendars) { FactoryBot.create_list(:calendar, 5, :with_stories) }
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

    # TODO: should not write on type: :request
    skip 'responds with calendars and resources and stories and events as object.' do
      subject
      json = JSON.parse(response.body)
      req_calendar = json["data"]
      
      expect(req_calendar["stories"]).not_to eq nil
      expect(req_calendar["stories"].length).to eq 5
      expect(req_calendar["stories"][0]["resources"].length).to eq 5
      expect(req_calendar["stories"][0]["resources"][0].events.length).to eq 5
    end
  end

  describe "POST #create" do
    let(:calendar) { { stories_attributes: [story] } }
    let(:story) { { name: 'story-name', resources_attributes: [resource] } }
    let(:resource) { { event_border_color: 'red', field: 'filed', order: 1, events_attributes: [event] } }
    let(:event) { { description: 'description', title: 'title', ended_at: now, started_at: now} }
    let(:now) { Date }
    let(:params) { { calendar: calendar } }

    subject { post api_v1_calendars_path, params: params }

    it 'can be sucess.' do
      subject
      expect(response.status).to eq 200
    end

    it 'responds JSON.' do
      subject
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    # TODO: should not write on type: :request
    it 'creates data internally.' do
      expect { subject }.to change { Calendar.count }.by(1)
        .and change { Story.count }.by(1)
        .and change { Resource.count }.by(1)
        .and change { Event.count }.by(1)
    end
    
  end

end