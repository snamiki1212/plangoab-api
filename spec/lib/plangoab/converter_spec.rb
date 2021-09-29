require 'rails_helper'

RSpec.describe Plangoab::Converter, type: :lib do

  describe '#convert_into_attributes_suffix' do
    subject { described_class.convert_into_attributes_suffix!(obj, scheme) }

    describe do
      let(:obj) { { parent1: nil, parent2: nil } }
      let(:scheme) { {parent1: nil, parent2: nil} }
      it { is_expected.to include( { parent1_attributes: nil, parent2_attributes: nil } ) }
    end

    describe do
      let(:obj) { { stories: [story, story] } }
      let(:scheme) { { stories: { resources: { events: nil } } } }

      let(:story) { {id: "story", resources: [ resource, resource] }}
      let(:resource) { { id: "resource", events: [event, event] }}
      let(:event) { {id: 'event'} }

      it { is_expected.to include( { stories_attributes: [
        {id: "story", resources_attributes: [
          {id: "resource", events_attributes: [ {id: "event"}, {id: "event"} ] },
          {id: "resource", events_attributes: [ {id: "event"}, {id: "event"} ] },
        ] },
        {id: "story", resources_attributes: [
          {id: "resource", events_attributes: [ {id: "event"}, {id: "event"} ] },
          {id: "resource", events_attributes: [ {id: "event"}, {id: "event"} ] },
        ] },
        ] } ) }
    end
  end
end