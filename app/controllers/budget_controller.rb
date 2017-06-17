class BudgetController < ApplicationController
  @sums
  @month
  
  def index
    @activities = Activity.all
    @categories = Category.all
    @sums = Hash.new
    @categories.each do |category|
      @sums[category.id] = 0
    end
    @activities.each do |activity|
      @sums[activity.category_id] += activity.amount
    end
  end
  
  def show
    @month = params[:id]
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @activities = Activity.all
    @categories = Category.all
    @expenses = Hash.new
    @incomes = Hash.new
    @categories.each do |category|
      @expenses[category.id] = 0
      @incomes[category.id] = 0
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
end
