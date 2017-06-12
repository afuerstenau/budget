class BudgetController < ApplicationController
  @sums
  
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
    month = params[:id]
    
    @activities = Activity.all
    @categories = Category.all
    @sums = Hash.new
    @categories.each do |category|
      @sums[category.id] = 0
    end
    @activities.each do |activity|
      if activity.months.include? month 
        @sums[activity.category_id] += activity.amount
      end
    
    end
    render :index
  end
end
