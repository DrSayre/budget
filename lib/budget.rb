class Budget
  attr_reader :income, :expense, :remaining, :total_income, :total_expenses, :month, :year
  # Your code goes here...
  def initialize
    @income = Array.new
    @expense = Array.new
    @remaining = 0
    @total_income = 0
    @total_expenses = 0
    @month = Time.now.month
    @year = Time.now.year
  end

  def set_month(liMonth, liYear)
    raise RangeError, 'Month must be an integer 1 - 12' if  ((!liMonth.is_a? Integer) || liMonth < 1 || liMonth > 12)
    raise RangeError, 'Year must be an integer' if (!liYear.is_a? Integer)
    @month = liMonth
    @year = liYear
  end

  def add_income(pfIncome, psMemo = "Income Item #{self.income.count + 1}", pdDate = Time.now)
    raise TypeError, 'Amount parameter must be numeric' if !is_numeric?(pfIncome)
    lhIncome = Hash.new
    lhIncome["amount"] = pfIncome.round(2)
    lhIncome["memo"] = psMemo.to_s
    lhIncome["date"] = pdDate
    @income << lhIncome
    set_total_income()
    set_difference()
  end
 
  def set_total_income
    lfIncome = get_income()
    @total_income = lfIncome.round(2)
  end

  def add_expense(pfAmount, psMemo = "Expense Item #{self.expense.count + 1}", pdDate = Time.now)
    raise TypeError, 'Amount parameter must be numeric' if !is_numeric?(pfAmount)
    lhExpense = Hash.new
    lhExpense["amount"] = pfAmount.round(2)
    lhExpense["memo"] = psMemo.to_s
    lhExpense["date"] = pdDate
    @expense << lhExpense
    set_total_expenses()
    set_difference()
  end

  def set_total_expenses
    lfTotalExpenses = get_expenses()
    @total_expenses = lfTotalExpenses.round(2)
  end

  def get_income
    lfTotalIncome = 0
    @income.each do |i|
      lfTotalIncome = lfTotalIncome + i["amount"].round(2)
    end
    return lfTotalIncome
  end

  def get_expenses
    lfTotalExpenses = 0
    @expense.each do |i|
      lfTotalExpenses = lfTotalExpenses + i["amount"].round(2)
    end
    return lfTotalExpenses
  end

  def set_difference
    lfIncome = get_income()
    lfExpenses = get_expenses()
    lfDifference = lfIncome - lfExpenses
    @remaining = lfDifference
  end

  def delete_income(piIndex)
    @income.delete_at(piIndex)
    set_total_income()
    set_difference()
  end

  def delete_expense(piIndex)
    @expense.delete_at(piIndex)
    set_total_expenses()
    set_difference()
  end
  
  def complete?
    if @total_expenses == @total_income
      return true
    end
    return false
  end

  def is_numeric?(obj) 
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
end
