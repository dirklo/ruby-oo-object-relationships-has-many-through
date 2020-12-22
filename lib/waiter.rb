class Waiter
    attr_reader :name, :years

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, years)
        @name = name
        @years = years
        @meals = []
        self.class.all << self
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
        meals << meal
    end

    def meals
        Meal.all.filter{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipped_meal = meals.max{|meal_a, meal_b|meal_a.tip <=> meal_b.tip}
        best_tipped_meal.customer
    end
end