class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  validates :title, presence: true, length: {maximum: 50}
  validates :servings, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :prep_time, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :cook_time, numericality: { greater_than_or_equal_to: 1 }
end
