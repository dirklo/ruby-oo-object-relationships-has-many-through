class Customer
    attr_reader :name, :age
    attr_accessor :meals

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, age)
        @name = name
        @age = age
        @meals = []
        self.class.all << self
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
        meals << meal
    end

    def waiters
        meals.each.collect{|meal| meal.waiter}.uniq
    end
end