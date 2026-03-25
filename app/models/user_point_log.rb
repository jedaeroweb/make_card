class UserPointLog < ApplicationRecord
  belongs_to :user, autosave: true
end
