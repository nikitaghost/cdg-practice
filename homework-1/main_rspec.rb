require 'rspec'
require './main.rb'

RSpec.describe "Main" do 
  it "#greeting with an age less than 18" do
    expect(greeting("Ivan", "Lomov", 16)).to eq("Привет, Ivan Lomov. Тебе меньше 18 лет, но начать учиться программировать никогда не рано.")
  end

  it "#greeting with an age greater than 18" do
    expect(greeting("Ivan", "Lomov", 29)).to eq("Привет, Ivan Lomov. Самое время заняться делом!")
  end

  it "#foobar with all numbers not equal to 20" do 
    expect(foobar(13, 56)).to eq(69)
  end

  it "#foobar with the 1st number equal to 20 and the 2nd number not equal to 20" do 
    expect(foobar(20, 3)).to eq(3)
  end

  it "#foobar with the 1st number not equal to 20 and the 2nd number equal to 20" do 
    expect(foobar(4, 20)).to eq(20)
  end

  it "#foobar with all numbers equal to 20" do 
    expect(foobar(20, 20)).to eq(20)
  end
end