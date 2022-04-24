class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]
  #skip_before_action :verify_authenticity_token

  # GET /pokemons
  def index
    Rails.logger.info("call search with params #{params} ")

    @pokemons = Pokemon.all
    @pokemons = @pokemons.where('name like ?', "%"+params[:name]+"%") if params[:name].present?
    @pokemons = @pokemons.where('type_1 like ?', "%"+params[:type_1]+"%") if params[:type_1].present?
    @pokemons = @pokemons.where('type_2 like ?', "%"+params[:type_2]+"%") if params[:type_2].present?
    @pokemons = @pokemons.where('total = ?', "%"+params[:total]+"%") if params[:total].present?
    @pokemons = @pokemons.where('hp = ?', params[:hp]) if params[:hp].present?
    @pokemons = @pokemons.where('attack = ?', params[:attack]) if params[:attack].present?
    @pokemons = @pokemons.where('defense = ?', params[:defense]) if params[:defense].present?
    @pokemons = @pokemons.where('spatk = ?', params[:spatk]) if params[:spatk].present?
    @pokemons = @pokemons.where('spdef = ?', params[:spdef]) if params[:spdef].present?
    @pokemons = @pokemons.where('speed = ?', params[:speed]) if params[:speed].present?
    @pokemons = @pokemons.where('generation = ?', params[:generation]) if params[:generation].present?
    @pokemons = @pokemons.where('legendary = ?', params[:legendary]) if params[:legendary].present?
    @pokemons = @pokemons.limit(params[:limit]).offset(params[:page])


    render json: @pokemons
  end

  # GET /pokemons/1
  def show
    render json: @pokemon
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :spatk, :spdef, :speed, :generation, :legendary)
    end
end
