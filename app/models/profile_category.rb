class ProfileCategory < ApplicationRecord
  belongs_to :profile
  belongs_to :category
end
