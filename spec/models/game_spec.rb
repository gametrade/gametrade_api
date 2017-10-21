require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    subject { create(:game) }

    context 'when create' do
      it { expect(subject).to be_valid }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:players) }
      # it { is_expected.to validate_presence_of(:launch_date) }
      it { is_expected.to validate_presence_of(:lifetime) }
    end
  end
end
