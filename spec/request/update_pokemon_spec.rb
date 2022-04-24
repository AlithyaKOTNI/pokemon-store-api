require 'rails_helper'

RSpec.describe 'UpdatePokemon', type: :request do
  before do
    put '/api/v1/pokemons/5', params: {
      pokemon: {
        "name": "Updated Name test",
        "type_1": "Normalupdated",
        "type_2": "WaterProof updated",
        "total": 123,
        "hp": 100,
        "attack": 123,
        "defense": 75,
        "spatk": 57,
        "spdef": 75,
        "speed": 80,
        "generation": 5,
        "legendary": true
      }
    }
  end

  after do
    # Do nothing
  end

  context 'update pokemon' do
    it 'can update a pokemon' do
      expect(JSON.parse(response.body)['name']).to eq('Updated Name test')
      expect(JSON.parse(response.body)['type_2']).to eq('WaterProof updated')
    end
  end
end