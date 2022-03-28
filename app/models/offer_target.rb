class OfferTarget < ApplicationRecord
  belongs_to :offer
  belongs_to :operating_system
  belongs_to :locale
  belongs_to :gender
end
