class Step < ActiveRecord::Base
  belongs_to :recipe
  validates :description, presence: true
  validates :sequence, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
