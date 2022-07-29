class CreateCourseenrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :courseenrollments do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
