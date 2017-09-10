require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
    subject { create(:user) }

    context 'when create' do
      it { expect(subject).to be_valid }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:identification_document) }
      it { is_expected.to validate_presence_of(:birth_date) }
    end
  end
end
