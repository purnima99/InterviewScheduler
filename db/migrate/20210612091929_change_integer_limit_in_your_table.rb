class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[6.1]
  def change
    change_column :interviewers, :phone, :integer, limit: 8
    change_column :interviewees, :phone, :integer, limit: 8
  end 
end
