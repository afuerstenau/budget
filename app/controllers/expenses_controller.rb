class ExpensesController < ApplicationController
  
  def index
   @month = Date.today.month.to_s
   show()
  end
  
  def show
    render :index
  end
end
