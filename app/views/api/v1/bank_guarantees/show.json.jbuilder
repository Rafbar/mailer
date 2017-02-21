json.extract! @bank_guarantee, :id, :created_at
if @bank_guarantee.owner_transaction
  json.transaction_id @bank_guarantee.owner_transaction.id
end
