require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view       = CustomerView.new
  end

  def list
    # 1. Go to the repo and GET the list of meals
    customers = @customer_repository.all
    # 2. Send the list of customers into the view
    @customer_view.display_customers(customers)
  end

  def add
    # 1. Go to the view and ASK for name and price
    name =  @customer_view.ask_for_name
    address = @customer_view.ask_for_address
    # 2. Create a new meal instance with those values
    customer = Customer.new(name: name, address: address)
    # 3. Save it into the repo
    @customer_repository.add(customer)
  end
end