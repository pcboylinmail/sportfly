class Watching < ApplicationRecord
  belongs_to :user
  belongs_to :live_show
end
