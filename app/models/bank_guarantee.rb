class BankGuarantee < ApplicationRecord
  acts_as_paranoid

  belongs_to :owner_transaction, foreign_key: "transaction_id", class_name: "Transaction"

  validates_presence_of :owner_transaction
end
