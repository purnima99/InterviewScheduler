class CreateInterviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :interviewers do |t|
      t.string :name
      t.string :email_id
      t.integer :phone

      t.timestamps
    end
  end
end
