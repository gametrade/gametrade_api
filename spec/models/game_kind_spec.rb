require 'rails_helper'

RSpec.describe GameKind, type: :model do
  describe 'validations' do
    subject { create(:game_kind) }

    context 'when create' do
      it { expect(subject).to be_valid }
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
