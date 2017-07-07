class BudgetController < ApplicationController
  @sums
  @month
  
  def index
   @month = Date.today.month.to_s
   show()
  end
  
  def show
    @month = params[:id] unless params[:id].nil?
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @activities = Activity.all
    @categories = Category.all
    @expenses = Hash.new
    @incomes = Hash.new
    @categories.each do |category|
      @expenses[category.id] = 0 unless category.income
      @incomes[category.id] = 0 unless category.expense
    end
    @total_expenses = 0
    @total_incomes = 0
    @activities.each do |activity|
      if activity.months.include? @month 
        if activity.amount < 0
          @expenses[activity.category_id] += activity.amount
          @total_expenses += activity.amount
        else
          @incomes[activity.category_id] += activity.amount
          @total_incomes += activity.amount
        end
      end
    end
    
    render :index
  end

  def show_complete
    @month = params[:id]
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @activities = Activity.all
    @categories = Category.all
    @expenses = Hash.new
    @incomes = Hash.new
    print("category id expenses: #{@expenses}")
    print("category id incomes: #{@incomes}")
    @total_expenses = 0
    @total_incomes = 0
    @activities.each do |activity|
      if activity.months.include? @month 
        if activity.amount < 0
          @expenses[activity.name] = activity.amount
          @total_expenses += activity.amount
        else
          print("category id: #{activity.category_id} , amount: #{activity.amount}")
          @incomes[activity.name] = activity.amount
          @total_incomes += activity.amount
        end
      end
    end
    
    render :index_complete
  end
end
