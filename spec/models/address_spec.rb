require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    subject { create(:address) }

    context 'when create' do
      it { expect(subject).to be_valid }
      it { is_expected.to validate_presence_of(:kind) }
      it { is_expected.to validate_presence_of(:street) }
      it { is_expected.to validate_presence_of(:number) }
      it { is_expected.to validate_presence_of(:zip_code) }
      it { is_expected.to validate_presence_of(:street) }
      it { is_expected.to validate_presence_of(:state) }
      it { is_expected.to validate_presence_of(:country) }
    end
  end
end
