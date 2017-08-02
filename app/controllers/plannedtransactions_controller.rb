class PlannedtransactionsController < ApplicationController
  before_action :set_plannedtransaction, only: [:show, :edit, :update, :destroy]

  # GET /plannedtransactions
  # GET /plannedtransactions.json
  def index
    @plannedtransactions = Plannedtransaction.all
  end

  # GET /plannedtransactions/1
  # GET /plannedtransactions/1.json
  def show
  end

  # GET /plannedtransactions/new
  def new
    @plannedtransaction = Plannedtransaction.new
  end

  # GET /plannedtransactions/1/edit
  def edit
  end

  # POST /plannedtransactions
  # POST /plannedtransactions.json
  def create
    @plannedtransaction = Plannedtransaction.new(plannedtransaction_params)

    respond_to do |format|
      if @plannedtransaction.save
        format.html { redirect_to @plannedtransaction, notice: 'Planned Transaction was successfully created.' }
        format.json { redirect_to plannedtransactions_url, status: :created, location: @plannedtransaction }
      else
        format.html { render :new }
        format.json { render json: @plannedtransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plannedtransactions/1
  # PATCH/PUT /plannedtransactions/1.json
  def update
    respond_to do |format|
      if @plannedtransaction.update(plannedtransaction_params)
        format.html { redirect_to plannedtransactions_url, notice: 'Planned Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @plannedtransaction }
      else
        format.html { render :edit }
        format.json { render json: @plannedtransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plannedtransactions/1
  # DELETE /plannedtransactions/1.json
  def destroy
    @plannedtransaction.destroy
    respond_to do |format|
      format.html { redirect_to plannedtransactions_url, notice: 'Planned Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plannedtransaction
      @plannedtransaction = Plannedtransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plannedtransaction_params
      params.require(:plannedtransaction).permit(:name, :amount, :months, :repeat_yearly, :category_id, :date)
    end
end
