# An example for user of the template
class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.text :text, null: false

      t.timestamps null: false
    end
  end
end
