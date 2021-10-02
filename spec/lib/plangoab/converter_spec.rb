# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plangoab::Converter, type: :lib do
  describe '#append_attributes_suffix' do
    subject(:run) { described_class.append_attributes_suffix!(obj, scheme) }

    describe 'can run for no nested data.' do
      let(:obj) { { parent1: nil, parent2: nil } }
      let(:scheme) { { parent1: nil, parent2: nil } }

      it { is_expected.to include({ parent1_attributes: nil, parent2_attributes: nil }) }
    end

    describe 'can run for nested data.' do
      let(:obj) { { stories: [story, story] } }
      let(:scheme) { { stories: { resources: { events: nil } } } }

      let(:story) { { id: 'story', resources: [resource, resource] } }
      let(:resource) { { id: 'resource', events: [event, event] } }
      let(:event) { { id: 'event' } }

      it {
        expected = { stories_attributes: [
          { id: 'story', resources_attributes: [
            { id: 'resource', events_attributes: [{ id: 'event' }, { id: 'event' }] },
            { id: 'resource', events_attributes: [{ id: 'event' }, { id: 'event' }] }
          ] },
          { id: 'story', resources_attributes: [
            { id: 'resource', events_attributes: [{ id: 'event' }, { id: 'event' }] },
            { id: 'resource', events_attributes: [{ id: 'event' }, { id: 'event' }] }
          ] }
        ] }
        expect(run).to include(expected)
      }
    end
  end
end
