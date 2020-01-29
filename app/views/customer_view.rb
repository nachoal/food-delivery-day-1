class CustomerView

  # Takes an array of meal instances
  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.name}, #{customer.address}"
    end
  end

  def ask_for_name
    puts 'Whats the customer name?'
    gets.chomp
  end

  def ask_for_address
    puts 'Whats the customer address?'
    gets.chomp
  end
end