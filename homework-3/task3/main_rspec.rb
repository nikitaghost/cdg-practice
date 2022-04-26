require 'rspec'
require './main.rb'

RSpec.describe "task3" do
  before(:each) {File.write(BALANCE_FILE_PATH, "100.0", mode:"w")}

  it '#deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", 99, "q")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\nEnter the amount for deposit 199.0\npress D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end

  it '#deposit with mistake' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", -100, "q")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\nEnter the amount for deposit Amount should be > 0\npress D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end

  it '#balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("b", "q")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n100.0\npress D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end

  it '#quit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("q\n")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end

  it '#withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", 50, "q\n")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\nEnter the amount for withdraw: 50.0\npress D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end

  it '#withdraw with mistake' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -150, "q\n")
    expect{menu}.to output("Your balance is 100.0 press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\nEnter the amount for withdraw: Amount should be > 0 and < balance\npress D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)\n").to_stdout
  end
end
