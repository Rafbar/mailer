class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.order(:id).all
  end

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)
    
    if @transaction.save
      render :show, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render :show, status: :ok
    else
       render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @transaction.destroy
      head :no_content
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name)
    end  
end
