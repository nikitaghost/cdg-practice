require 'rspec'
require './main.rb'

RSpec.describe "task2" do
  before(:each) do
    students = [
      "Tyyne Joyce 19",
      "Bertram Benetton 17",
      "Nilus Krikorian 24",
      "Taonga Kovac 23",
      "Auston Warshawsky 20",
      "Libbie Haraldsson 18",
      "Valentina Olasz 16",
      "Iva Halmi 22",
      "Orit Siskind 28",
      "Ayten Afolabi 30"
    ]

    File.write(STUDENTS_PATH, students.join("\n"))
    File.write(RESULTS_PATH, "")
  end

  it "#without negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 17, 24, 23, 20, 18, 16, 22, 28, 30)
    expect{main}.to output("Enter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nTyyne Joyce 19\nBertram Benetton 17\nNilus Krikorian 24\nTaonga Kovac 23\nAuston Warshawsky 20\nLibbie Haraldsson 18\nValentina Olasz 16\nIva Halmi 22\nOrit Siskind 28\nAyten Afolabi 30\n").to_stdout
  end

  it "#with negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 20, -1)
    expect{main}.to output("Enter age of student\nEnter age of student\nEnter age of student\nYou entered -1\nTyyne Joyce 19\nAuston Warshawsky 20\n").to_stdout
  end

  it "#straightaway negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
    expect{main}.to output("Enter age of student\nYou entered -1\n").to_stdout
  end
end