require 'rails_helper'

RSpec.describe 'SearchPaginatePokemon', type: :request do
  before do
    # Do nothing
    get '/api/v1/pokemons' , params: {
      generation: 4,
      page: 2,
      limit:10
    }
  end

  after do
    # Do nothing
  end

  context 'with valid paramters ' do
    it 'contains result' do
      expect(JSON.parse(response.body).size).to eq(10)
      expect(JSON.parse(response.body)[0]['name']).to eq('Torterra')
    end
  end
end