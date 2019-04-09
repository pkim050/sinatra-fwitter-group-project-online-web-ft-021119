class CreateTweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |element|
      element.text :content
      element.integer :user_id
    end
  end
end
