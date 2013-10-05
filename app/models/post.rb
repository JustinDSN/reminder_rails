class Post < ActiveRecord::Base
    validates :feeling, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
    validates :functioning, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
    validates :user_id, presence: true, numericality: { only_integer: true }

    belongs_to :user
end
