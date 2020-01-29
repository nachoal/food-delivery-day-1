require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers     = []
    @next_id       = 1

    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def find(customer_id)
    @customers.find do |customer|
      customer.id == customer_id.to_i
    end
  end

  def add(customer)
    # 1. Should add a customer to the list (@customers)
    @customers << customer
    # 2. Should set its id
    customer.id = @next_id
    # 3. Auto increment next_id by 1
    @next_id += 1
    # 4. Save into the database

    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]      = row[:id].to_i

      customer = Customer.new(row)

      @customers << customer
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_csv
    csv_options = { col_sep: ','}
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'address']
      @customers.each  do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

