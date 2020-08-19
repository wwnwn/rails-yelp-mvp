class Restaurant < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :name, :adress, :category, presence: true, allow_nil: false
end
