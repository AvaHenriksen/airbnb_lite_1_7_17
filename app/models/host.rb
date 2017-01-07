class Host < ApplicationRecord
  # Direct associations

  has_many   :bookings,
             :dependent => :destroy

  has_many   :ratings,
             :class_name => "Guestrating",
             :dependent => :destroy

  has_many   :messages,
             :dependent => :destroy

  has_many   :listings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
