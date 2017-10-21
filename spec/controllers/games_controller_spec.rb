require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:body) { JSON.parse(response.body) }

  describe 'GET' do
    let(:user) { create(:user) }

    before do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    describe '#index' do
      context 'with valid params' do
        let!(:game) { create(:game, user: user) }
        let(:body) { JSON.parse(response.body).first }
        before { get :index }

        it { expect(body['id']).to eq(Game.last.id) }
      end
    end

    describe '#show' do
      context 'with valid params' do
        let!(:game) { create(:game, user: user) }
        before do
          binding.pry
          get :show, params: { id: game.id }
        end

        it { expect(body['id']).to eq(game.id) }
      end
    end
  end
end
