class MealView

  # Takes an array of meal instances
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.name}, #{meal.price}"
    end
  end

  def ask_for_name
    puts 'Whats the meal name?'
    gets.chomp
  end

  def ask_for_price
    puts 'Whats the meal price?'
    gets.chomp.to_i
  end
end