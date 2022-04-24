# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }],)
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
filepath = "#{__dir__}/dataset/pokemon.csv"

CSV.foreach(filepath, headers: true) do |row|
  Pokemon.create({ name: row['Name'],
                   type_1: row['Type 1'],
                   type_2: row['Type 2'],
                   total: row['Total'],
                   hp: row['HP'],
                   attack: row['Attack'],
                   defense: row['Defense'],
                   spatk: row['Sp. Atk'],
                   spdef: row['Sp. Def'],
                   speed: row['Speed'],
                   generation: row['Generation'],
                   legendary: row['Legendary'] })
end
