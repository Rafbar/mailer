class Api::V1::BankGuaranteesController < ApplicationController
  before_action :set_bank_guarantee, only: [:show, :update, :destroy]

  def show
  end

  def create
    @bank_guarantee = BankGuarantee.new(bank_guarantee_params)

    if @bank_guarantee.save
      render :show, status: :created
    else
      render json: @bank_guarantee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bank_guarantee.update(bank_guarantee_params)
      render :show, status: :ok
    else
      render json: @bank_guarantee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @bank_guarantee.destroy
      head :no_content
    else
      render json: @bank_guarantee.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_guarantee
      @bank_guarantee = BankGuarantee.where(id: params[:id], transaction_id: params[:transaction_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_guarantee_params
      params.require(:bank_guarantee).permit(:transaction_id)
    end  
end
