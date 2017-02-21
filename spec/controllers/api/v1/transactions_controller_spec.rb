require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  let(:valid_attributes) {
    {name: "aa"}
  }

  describe "GET #index" do
    it "returns http success" do
      Transaction.create valid_attributes
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "assigns transactions" do
      Transaction.create valid_attributes
      get :index, format: :json
      expect(assigns(:transactions)).to eq(Transaction.order(:id).all)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      transaction = Transaction.create valid_attributes
      get :show, params: {id: transaction.id}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "assigns requested transaction" do
      transaction = Transaction.create valid_attributes
      get :show, params: {id: transaction.id}, format: :json
      expect(assigns(:transaction)).to eq(transaction)
    end
  end

  describe "POST #create" do
    it "creates a new transaction" do
      expect {
        post :create, params: {transaction: valid_attributes}, format: :json
        }.to change(Transaction, :count).by(1)
    end

    it "returns http success" do
      post :create, params: {transaction: valid_attributes}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "assigns newly created transaction" do
      post :create, params: {transaction: valid_attributes}, format: :json
      expect(assigns(:transaction)).to be_a(Transaction)
      expect(assigns(:transaction)).to be_persisted
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      {name: 'sadas'}
    }

    it "returns http success" do
      transaction = Transaction.create valid_attributes
      put :update, params: {id: transaction.id, transaction: new_attributes}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "updates the requested transaction" do
      transaction = Transaction.create valid_attributes
      put :update, params: {id: transaction.id, transaction: new_attributes}, format: :json
      transaction.reload
      expect(transaction.name).to eq(new_attributes[:name])
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      transaction = Transaction.create valid_attributes
      delete :destroy, params: {id: transaction.id}, format: :json
      expect(response).to have_http_status(:success)
    end

    it "destroys the requested transaction" do
      transaction = Transaction.create valid_attributes
      expect {
        delete :destroy, params: {id: transaction.id}, format: :json
      }.to change(Transaction, :count).by(-1)
    end
  end

end
