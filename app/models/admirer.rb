class Admirer < ApplicationRecord

  belongs_to :user

  validates_presence_of :user_id, :admirer_id, :q1_response,
  :q2_response, :q3_response

  protected

  def self.create_admirer(admirer_params, current_user)
    @admirer = Admirer.new(admirer_params)
    @admirer.user_id = admirer_params[:user_id]
    @admirer.admirer_id = current_user.id
    @admirer.q1 = current_user.question_1
    @admirer.q2 = current_user.question_2
    @admirer.q3 = current_user.question_3
    @admirer.save 
    return @admirer
  end
end
