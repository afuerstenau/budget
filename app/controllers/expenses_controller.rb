class ExpensesController < ApplicationController
  
  def index
   @month = Date.today.month.to_s
   show()
  end
  
  def show
    @month = params[:id] unless params[:id].nil?
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @transactions = Transaction.where("value_date between :first_day_of_the_month and :last_day_of_the_month", {first_day_of_the_month: @monthname.at_beginning_of_month, last_day_of_the_month: @monthname.at_end_of_month})
    print " # of transactions:#{@transactions.count}"
    @categories = Category.all
    print "categories: #{@categories}"
    @expenses = Hash.new
    @incomes = Hash.new
    @categories.each do |category|
      @expenses[category.id] = 0 unless category.income
      @incomes[category.id] = 0 unless category.expense
    end
    @total_expenses = 0
    @total_incomes = 0
    @transactions.each do |transaction|
      if transaction.category_id != nil
        selected_category = @categories.find(transaction.category_id)
        if selected_category.expense
          @expenses[transaction.category_id] += transaction.amount
          @total_expenses += transaction.amount
        else
          # print "income #{@incomes}/ #{@incomes[plannedtransaction.category_id]}/ #{plannedtransaction.amount}"
          @incomes[transaction.category_id] += transaction.amount
          @total_incomes += transaction.amount
        end
      end
    end
    render :index
  end
end
