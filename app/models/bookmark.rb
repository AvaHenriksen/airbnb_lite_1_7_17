class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :guest

  belongs_to :listing

  # Indirect associations

  # Validations

end
