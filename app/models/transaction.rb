class Transaction < ApplicationRecord
  acts_as_paranoid

  has_one :bank_guarantee, dependent: :destroy
end
