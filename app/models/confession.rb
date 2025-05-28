class Confession < ApplicationRecord
  validates :body, presence: { message: "Must not be empty, please write something!" }, length: { maximum: 500, message: "Can have up to 500 characters only!" }
end
