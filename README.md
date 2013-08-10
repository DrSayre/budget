# Budget

The Budget gem is an object that models a person's monthly budget.  You can add income records and expenses for the person.  The goal is to make sure income equals expenses.  When income and expenses equal, complete will equal true.  The remaining variable will be how much money that person has left to "manage" before income and expenses equals.

## Installation

Add this line to your application's Gemfile:

    gem 'budget'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install budget

## Usage

Declare an instance of the object like normal:

foo = Budget.new

Add money coming in, or income, like this:

foo.add_income(Amount, Memo, Date)

Amount: Must be a numeric value
Memo: Defaults to "Income Item x" where x is the number of income records
Date: Defaults to now

Add money going out, or expenses, like this:

foo.add_expense(Amount, Memo, Date)

Parameters behave in the same way as add_income function

Set the month and year of budget like this:

foo.set_month(Month, Year)

Month: Must be an integer between 1 and 12
Year: Must be an integer

Check to see if budget is complete:

foo.complete?

Returns true if total income equals total expenses, otherwise returns false.  The goal should be to make total income and total expenses equal so budget is a zero sum budget.

Variables on object:

foo.total_income	Total income for the month
foo.total_expenses	Total expenses for the month
foo.remaining		Difference between total_income and total_expenses
foo.month		Month of budget
foo.year		Year of budget
foo.income		Array of all income records
foo.expense		Array of all expense records 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
