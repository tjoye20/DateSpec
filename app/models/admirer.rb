class Admirer < ApplicationRecord

  belongs_to :user
  
  validates_presence_of :user_id, :admirer_id, :q1_response,
  :q2_response, :q3_response

end
