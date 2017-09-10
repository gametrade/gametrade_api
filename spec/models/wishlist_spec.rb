require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }
    subject { create(:wishlist, user: user) }

    context 'when create' do
      it { expect(subject).to be_valid }
    end
  end

  describe 'belongs_mine' do
    context 'when validate' do
      it { expect(subject.game.user).not_to eq(subject.user) }
    end
  end
end
