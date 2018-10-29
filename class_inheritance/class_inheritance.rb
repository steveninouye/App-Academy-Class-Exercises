require "byebug"

class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    boss.add_employee(self) if boss
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_reader :salary, :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    get_all_salaries* multiplier
  end

  def get_all_salaries
    total_salary = 0
    # byebug
    @employees.each do |employee|
      total_salary += employee.salary
      total_salary += employee.get_all_salaries if employee.is_a?(Manager)
    end
    total_salary
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
