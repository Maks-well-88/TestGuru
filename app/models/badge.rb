class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :description, presence: true
  validates :title, presence: true,
                    uniqueness: true

  RULES = %i[first_pass level_1 category_backend]

end
