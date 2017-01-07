class Booking < ApplicationRecord
  # Direct associations

  has_many   :guestratings,
             :dependent => :destroy

  belongs_to :guest

  belongs_to :host

  # Indirect associations

  # Validations

end
