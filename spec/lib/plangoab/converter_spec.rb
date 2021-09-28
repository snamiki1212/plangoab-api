require 'rails_helper'

RSpec.describe Plangoab::Converter, type: :lib do

  describe '#replace_into_attributes_suffix' do
    subject { described_class.replace_into_attributes_suffix!(obj, params) }

    # describe do
    #   let(:obj) { { parent1: nil, parent2: nil } }
    #   let(:params) { {parent1: nil, parent2: nil} }
    #   it { is_expected.to include( { parent1_attributes: nil, parent2_attributes: nil } ) }
    # end

    describe do
      let(:obj) { { stories: [story, story] } }
      let(:params) { { stories: { resources: { events: nil } } } }

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

    # describe do
    #   let(:obj) { {parent: [ {childlen: [ { grand_children: [1]} ]}] } }
    #   let(:params) { {parent: {childlen: :grand_children} }}
    #   it { is_expected.to eq(({parent_attributes: [{ children_attributes: [grand_children: [1]] } ]})) }  
    # end
  end
end