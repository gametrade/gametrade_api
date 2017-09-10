require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    subject { create(:category) }

    context 'when create' do
      it { expect(subject).to be_valid }
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
