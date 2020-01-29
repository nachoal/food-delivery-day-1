# THIS WILL BE MOVED TO APP 

require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'

# MEALS:
meals_csv_file_path = 'data/meals.csv'
meal_repository     = MealRepository.new(meals_csv_file_path)
meals_controller    = MealsController.new(meal_repository)

# CUSTOMERS:
customers_csv_file_path = 'data/customers.csv'
customer_repository     = CustomerRepository.new(customers_csv_file_path)
customers_controller    = CustomersController.new(customer_repository)


running = true
while running
  # 1. Ask the user for what they want to do
  # 2. Display options
  puts "Press [1] to List all of the meals"
  puts "Press [2] to add a new meal"    
  puts "Press [3] to List all of the customers"
  puts "Press [4] to add a new customer"    
  puts "Press anything else to quit!"
  case gets.chomp
  when "1"
    meals_controller.list
  when "2"
    meals_controller.add
  when "3"
    customers_controller.list
  when "4"
    customers_controller.add
  else
    running = false
  end
end

