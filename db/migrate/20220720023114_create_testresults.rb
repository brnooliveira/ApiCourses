class CreateTestresults < ActiveRecord::Migration[7.0]
  def change
    create_table :testresults do |t|
      t.integer :result
      t.references :test, null: false, foreign_key: true
      t.references :grader, null: false, foreign_key: { to_table: 'users'}
      t.references :student, null: false, foreign_key: { to_table: 'users'}

      t.timestamps
    end
  end
end
