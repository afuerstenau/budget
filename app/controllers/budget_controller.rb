class BudgetController < ApplicationController
  @sums
  @month
  @previous_month
  @next_month
  
  def index
   @month = Date.today.month.to_s
   show()
  end
  
  def show
    Integer @month = params[:id] unless params[:id].nil?
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    @previous_month = Integer(@month)-1
    @previous_month = 12 if @previous_month == 0
    @next_month = Integer(@month)+1
    @next_month = 1 if @next_month == 13
    @plannedtransactions = Plannedtransaction.all
    @categories = Category.all
    @planned_expenses = Hash.new
    @planned_incomes = Hash.new
    @categories.each do |category|
      @planned_expenses[category.id] = 0
      @planned_incomes[category.id] = 0
    end
    @total_planned_expenses = 0
    @total_planned_incomes = 0
    @plannedtransactions.each do |plannedtransaction|
      var_name = Date::MONTHNAMES[@monthname.mon].downcase
      if plannedtransaction.attributes[var_name]
        selected_category = @categories.find(plannedtransaction.category_id)
        #print "category ID:#{selected_category.id} Name:#{selected_category.name} Expense:#{selected_category.expense}\n"
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
    
    @expenses = Hash.new
    @incomes = Hash.new
    @categories.each do |category|
      @expenses[category.id] = 0
      @incomes[category.id] = 0
    end
    @total_expenses = 0
    @total_incomes = 0
    @transactions = Transaction.where("value_date between :first_day_of_the_month and :last_day_of_the_month", {first_day_of_the_month: @monthname.at_beginning_of_month, last_day_of_the_month: @monthname.at_end_of_month})
    @transactions.each do |transaction|
      
        #print "expense? #{@categories[plannedtransaction.category_id].name}/ #{@categories[plannedtransaction.category_id].expense}\n"
        #print "planned_transaction Name:#{plannedtransaction.name} Amount:#{plannedtransaction.amount} Category:#{plannedtransaction.category_id} \n"
        if (transaction.category_id != nil)
        selected_category = @categories.find(transaction.category_id)
        #print "category ID:#{selected_category.id} Name:#{selected_category.name} Expense:#{selected_category.expense}\n"
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
  
  def show_by_category
    @category = Category.find(params[:category_id])
    @month = params[:id] unless params[:id].nil?
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @plannedtransactions = Plannedtransaction.where(category_id: @category.id)
    @planned_expenses = Hash.new
    @planned_incomes = Hash.new
   
    @planned_expenses[@category.id] = 0
    @planned_incomes[@category.id] = 0
    @total_planned_expenses = 0
    @total_planned_incomes = 0
    @plannedtransactions_by_month = []
    @plannedtransactions.each do |plannedtransaction|
      var_name = Date::MONTHNAMES[@monthname.mon].downcase
      if plannedtransaction.attributes[var_name]
        #print "expense? #{@categories[plannedtransaction.category_id].name}/ #{@categories[plannedtransaction.category_id].expense}\n"
        #print "planned_transaction Name:#{plannedtransaction.name} Amount:#{plannedtransaction.amount} Category:#{plannedtransaction.category_id} \n"
        @plannedtransactions_by_month << plannedtransaction
        if @category.expense
          @planned_expenses[plannedtransaction.category_id] += plannedtransaction.amount
          @total_planned_expenses += plannedtransaction.amount
        else
          # print "income #{@incomes}/ #{@incomes[plannedtransaction.category_id]}/ #{plannedtransaction.amount}"
          @planned_incomes[plannedtransaction.category_id] += plannedtransaction.amount
          @total_planned_incomes += plannedtransaction.amount
        end
      end
    end
    
    @expenses = Hash.new
    @incomes = Hash.new
    @expenses[@category.id] = 0
    @incomes[@category.id] = 0
    @total_expenses = 0
    @total_incomes = 0
    @transactions = Transaction.where("category_id = :category_id and value_date between :first_day_of_the_month and :last_day_of_the_month", {category_id: @category.id, first_day_of_the_month: @monthname.at_beginning_of_month, last_day_of_the_month: @monthname.at_end_of_month})
    @transactions.each do |transaction|
        
        if @category.expense
          @expenses[transaction.category_id] += transaction.amount
          @total_expenses += transaction.amount
        else
          # print "income #{@incomes}/ #{@incomes[plannedtransaction.category_id]}/ #{plannedtransaction.amount}"
          @incomes[transaction.category_id] += transaction.amount
          @total_incomes += transaction.amount
        end
    end
    render :by_category
  end

  def show_complete
    @month = params[:id]
    @monthname = date = Date.new(2017, Integer(@month), 01) 
    
    @plannedtransactions = Plannedtransaction.all
    @categories = Category.all
    @expenses = Hash.new
    @incomes = Hash.new
    #print("category id expenses: #{@expenses}")
    #print("category id incomes: #{@incomes}")
    @total_expenses = 0
    @total_incomes = 0
    @plannedtransactions.each do |plannedtransaction|
      var_name = Date::MONTHNAMES[@monthname.mon].downcase
      if plannedtransaction.attributes[var_name]
        if plannedtransaction.amount < 0
          @expenses[plannedtransaction.name] = plannedtransaction.amount
          @total_expenses += plannedtransaction.amount
        else
          #print("category id: #{plannedtransaction.category_id} , amount: #{plannedtransaction.amount}")
          @incomes[plannedtransaction.name] = plannedtransaction.amount
          @total_incomes += plannedtransaction.amount
        end
      end
    end
    
    render :index_complete
  end
end
