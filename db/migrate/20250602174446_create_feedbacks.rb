class CreateFeedbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :feedbacks do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification_number
      t.string :email
      t.string :company
      t.integer :enjoyment_experience_rating
      t.integer :benefit_discovery_rating
      t.integer :interaction_participation_rating
      t.text :notes

      t.timestamps
    end
  end
end
