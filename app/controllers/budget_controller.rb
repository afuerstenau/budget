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
    
    @plannedtransactions = Plannedtransaction.all
    @categories = Category.all
    print "categories: #{@categories}"
    @planned_expenses = Hash.new
    @planned_incomes = Hash.new
    @categories.each do |category|
      @planned_expenses[category.id] = 0
      @planned_incomes[category.id] = 0
    end
    @total_planned_expenses = 0
    @total_planned_incomes = 0
    @plannedtransactions.each do |plannedtransaction|
      if plannedtransaction.months.include? @month 
        #print "expense? #{@categories[plannedtransaction.category_id].name}/ #{@categories[plannedtransaction.category_id].expense}\n"
        #print "planned_transaction Name:#{plannedtransaction.name} Amount:#{plannedtransaction.amount} Category:#{plannedtransaction.category_id} \n"
        selected_category = @categories.find(plannedtransaction.category_id)
        print "category ID:#{selected_category.id} Name:#{selected_category.name} Expense:#{selected_category.expense}\n"
        if selected_category.expense
          @planned_expenses[plannedtransaction.category_id] += plannedtransaction.amount
          @total_planned_expenses += plannedtransaction.amount
        else
          # print "income #{@incomes}/ #{@incomes[plannedtransaction.category_id]}/ #{plannedtransaction.amount}"
          @planned_incomes[plannedtransaction.category_id] += plannedtransaction.amount
          @total_planned_incomes += plannedtransaction.amount
        end
      end
    end
    
    render :index
  end

  def show_complete
    @month = params[:id]
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @plannedtransactions = Plannedtransaction.all
    @categories = Category.all
    @expenses = Hash.new
    @incomes = Hash.new
    print("category id expenses: #{@expenses}")
    print("category id incomes: #{@incomes}")
    @total_expenses = 0
    @total_incomes = 0
    @plannedtransactions.each do |plannedtransaction|
      if plannedtransaction.months.include? @month 
        if plannedtransaction.amount < 0
          @expenses[plannedtransaction.name] = plannedtransaction.amount
          @total_expenses += plannedtransaction.amount
        else
          print("category id: #{plannedtransaction.category_id} , amount: #{plannedtransaction.amount}")
          @incomes[plannedtransaction.name] = plannedtransaction.amount
          @total_incomes += plannedtransaction.amount
        end
      end
    end
    
    render :index_complete
  end
end
