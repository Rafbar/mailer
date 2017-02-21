require 'rails_helper'

RSpec.describe Api::V1::BankGuaranteesController, type: :controller do

  let!(:transaction) {Transaction.create(name: 'zxc')}
  let(:transaction_id) {transaction.id}
  let(:valid_attributes) {
    {transaction_id: transaction_id}
  }

  describe "GET #show" do
    let!(:new_transaction){Transaction.create(name: 'xvf')}

    it "returns http success" do
      bank_guarantee = BankGuarantee.create valid_attributes
      get :show, params: {transaction_id: transaction_id, id: bank_guarantee.id}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "assigns requested bank_guarantee" do
      bank_guarantee = BankGuarantee.create valid_attributes
      get :show, params: {transaction_id: transaction_id, id: bank_guarantee.id}, format: :json
      expect(assigns(:bank_guarantee)).to eq(bank_guarantee)
    end

    it "doesn't assign unassociated bank_guarantees" do
      bank_guarantee = BankGuarantee.create valid_attributes
      get :show, params: {transaction_id: new_transaction.id, id: bank_guarantee.id}, format: :json
      expect(assigns(:bank_guarantee)).to eq(nil)
    end
  end

  describe "POST #create" do
    it "creates a new bank_guarantee" do
      expect {
        post :create, params: {transaction_id: transaction_id, bank_guarantee: valid_attributes}, format: :json
        }.to change(BankGuarantee, :count).by(1)
    end

    it "returns http success" do
      post :create, params: {transaction_id: transaction_id, bank_guarantee: valid_attributes}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "assigns newly created bank_guarantee" do
      post :create, params: {transaction_id: transaction_id, bank_guarantee: valid_attributes}, format: :json
      expect(assigns(:bank_guarantee)).to be_a(BankGuarantee)
      expect(assigns(:bank_guarantee)).to be_persisted
    end
  end

  describe "PUT #update" do
    let!(:new_transaction){Transaction.create(name: 'xvf')}
    let(:new_attributes) {
      {transaction_id: new_transaction.id}
    }

    it "returns http success" do
      bank_guarantee = BankGuarantee.create valid_attributes
      put :update, params: {id: bank_guarantee.id, transaction_id: transaction.id, bank_guarantee: new_attributes}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "updates the requested bank_guarantee" do
      bank_guarantee = BankGuarantee.create valid_attributes
      put :update, params: {id: bank_guarantee.id, transaction_id: transaction.id, bank_guarantee: new_attributes}, format: :json
      bank_guarantee.reload
      expect(bank_guarantee.transaction_id).to eq(new_attributes[:transaction_id])
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      bank_guarantee = BankGuarantee.create valid_attributes
      delete :destroy, params: {transaction_id: transaction_id, id: bank_guarantee.id}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "destroys the requested bank_guarantee" do
       bank_guarantee = BankGuarantee.create valid_attributes
      expect {
        delete :destroy, params: {transaction_id: transaction_id, id: bank_guarantee.id}, format: :json
      }.to change(BankGuarantee, :count).by(-1)
    end
  end

end
