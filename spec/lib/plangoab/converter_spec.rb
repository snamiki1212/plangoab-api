require 'rails_helper'

RSpec.describe Plangoab::Converter, type: :lib do

  describe '#replace_into_attributes_suffix' do
    subject { described_class.replace_into_attributes_suffix!(obj, params) }

    describe do
      let(:obj) { { parent1: nil, parent2: nil } }
      let(:params) { [:parent1, :parent2] }
      it { is_expected.to include( { parent1_attributes: nil, parent2_attributes: nil } ) }
    end

    # describe do
    #   let(:obj) { {parent: [ {childlen: [ { grand_children: [1]} ]}] } }
    #   let(:params) { {parent: {childlen: :grand_children} }}
    #   it { is_expected.to eq(({parent_attributes: [{ children_attributes: [grand_children: [1]] } ]})) }  
    # end
  end
end