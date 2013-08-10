require 'test/unit'
require 'budget'

class BudgetTest < Test::Unit::TestCase
  def test_budget
    foo = Budget.new
    # Test the inital month and year is the current month and year
    assert_equal Time.now.month, foo.month
    assert_equal Time.now.year, foo.year
    # Test we can change month to May 2015
    foo.set_month(5,2015)
    assert_equal 5, foo.month
    assert_equal 2015, foo.year
    # Test we can add $500 income
    foo.add_income(500)
    assert_equal 500, foo.total_income
    assert_equal 500, foo.remaining
    assert_equal 0, foo.total_expenses
    foo.add_income(500)
    assert_equal 1000, foo.total_income
    assert_equal 1000, foo.remaining
    assert_equal 0, foo.total_expenses
    # Test to make sure memo is set to default with the right number 
    assert_equal 'Income Item 1', foo.income[0]["memo"]
    assert_equal 'Income Item 2', foo.income[1]["memo"]
    foo.add_income(500, 'Paycheck 3')
    assert_equal 'Paycheck 3', foo.income[2]["memo"]
    # Test to make sure budget is not complete at the moment
    assert !foo.complete?
    # Add a few expenses
    foo.add_expense(200)
    foo.add_expense(400)
    assert_equal 600, foo.total_expenses
    assert_equal 200, foo.expense[0]["amount"]
    assert_equal 400, foo.expense[1]["amount"]
    # Make sure budget still is not complete
    assert !foo.complete?
    foo.add_expense(900, 'Mortgage')
    assert_equal 1500, foo.total_expenses
    assert foo.complete?
    assert_equal 0, foo.remaining
    # Remove last first expense
    foo.delete_expense(0)
    assert !foo.complete?
    assert_equal 1300, foo.total_expenses
    assert_equal 200, foo.remaining
    foo.add_expense(200)
    assert_equal 'Expense Item 3', foo.expense[2]["memo"]
    foo.delete_income(2)
    assert !foo.complete?
    assert_equal -500, foo.remaining
    assert_equal 1000, foo.total_income
    foo.add_income(500)
    assert foo.complete?    
  end
end
