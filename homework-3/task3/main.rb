DEFAULT_BALANCE = 100.0
BALANCE_FILE_PATH = 'balance.txt'

def init
  if !File.exist?(BALANCE_FILE_PATH)
    @balance = DEFAULT_BALANCE
  else
    @balance = File.readlines(BALANCE_FILE_PATH).first.chomp.to_f
  end
end

def balance
  @balance
end

def deposit(amount)
  if amount > 0
    @balance += amount
  else
    "Amount should be > 0"
  end
end

def withdraw(amount)
  if amount > 0 && amount <= @balance
    @balance -= amount
  else
    "Amount should be > 0 and < balance"
  end
end

def menu
  init()

  puts "Your balance is #{balance()} press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)"

  loop do
    input = gets.chomp.downcase

    case input
    when "q"
      break
    when "b"
      puts balance
    when "w"
      print "Enter the amount for withdraw: "
      amount = gets.to_f
      puts withdraw(amount)
    when "d"
      print "Enter the amount for deposit "
      amount = gets.to_f
      puts deposit(amount)
    end

    puts "press D (DEPOSIT) W (WITHDRAW) B (SHOW BALANCE) Q(QUIT)"
  end

  File.write(BALANCE_FILE_PATH, @balance)
end

# menu()