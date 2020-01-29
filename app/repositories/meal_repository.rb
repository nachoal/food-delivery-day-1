require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals         = []
    @next_id       = 1

    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find do |meal|
      meal.id == meal_id.to_i
    end
  end

  def add(meal)
    # 1. Should add a meal to the list (@meals)
    @meals << meal
    # 2. Should set its id
    meal.id = @next_id
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
      row[:price]   = row[:price].to_i

      meal = Meal.new(row)

      @meals << meal
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    csv_options = { col_sep: ','}
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']
      @meals.each  do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end

