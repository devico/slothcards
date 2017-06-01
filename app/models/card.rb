class Card < ApplicationRecord
  default_scope { where(public_status: false) }
  belongs_to :user 

end
