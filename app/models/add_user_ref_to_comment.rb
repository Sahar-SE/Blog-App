class AddUserRefToComment < ApplicationRecord # rubocop:todo Layout/EndOfLine
  belongs_to :user
end
