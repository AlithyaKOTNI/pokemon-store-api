require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post '/api/v1/pokemons', params:
          { pokemon: {
            "name": "PIKA PIKA",
            "type_1": "ELECTRO",
            "type_2": "ELCTRO",
            "total": 123,
            "hp": 100,
            "attack": 123,
            "defense": 75,
            "spatk": 57,
            "spdef": 75,
            "speed": 80,
            "generation": 5,
            "legendary": true
          } }
      end

      it 'returns the attributes of the added pokemon' do
        expect(JSON.parse(response.body)['name']).to eq("PIKA PIKA")
        expect(JSON.parse(response.body)['legendary']).to eq(true)
        expect(JSON.parse(response.body)['generation']).to eq(5)
        expect(JSON.parse(response.body)['speed']).to eq(80)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end