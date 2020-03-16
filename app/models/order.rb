class Order < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  monetize :amount_cents
end
