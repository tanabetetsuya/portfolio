class Event < ApplicationRecord
  belongs_to :user

  #attr_accessor :title, :message

  validates :title, presence: true

end
