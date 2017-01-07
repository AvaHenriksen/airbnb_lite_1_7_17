class Listing < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :host

  # Indirect associations

  # Validations

end
