class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :main_question, null: false

      t.timestamps
    end
  end
end
