require 'rspec'
require './main.rb'

RSpec.describe "Main" do 
  it "#check_word with a word ending in \"CS\"" do
    expect(check_word("wordCS")).to eq(64)
  end
  
  it "#check_word with a word not ending in \"CS\"" do
    expect(check_word("sample")).to eq("elpmas")
  end

  it "#create_pokemons_array with number_of_pokemons eq 2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Bulbasaur', 'Blue', 'Pikachu', 'Yellow')
    expect(create_pokemons_array(2)).to eq([{ "Bulbasaur" => "Blue" }, { "Pikachu" => "Yellow" }])
  end

  it "#create_pokemons_array with number_of_pokemons eq 0" do
    expect(create_pokemons_array(0)).to eq([])
  end
end