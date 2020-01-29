require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view       = MealView.new
  end

  def list
    # 1. Go to the repo and GET the list of meals
    meals = @meal_repository.all
    # 2. Send the list of meals into the view
    @meal_view.display_meals(meals)
  end

  def add
    # 1. Go to the view and ASK for name and price
    name =  @meal_view.ask_for_name
    price = @meal_view.ask_for_price
    # 2. Create a new meal instance with those values
    meal = Meal.new(name: name, price: price)
    # 3. Save it into the repo
    @meal_repository.add(meal)
  end
end