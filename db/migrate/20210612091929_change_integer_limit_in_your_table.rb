class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[6.1]
  def change
    change_column :interviewer, :phone, :integer, limit: 8
    change_column :interviewee, :phone, :integer, limit: 8
  end 
end
