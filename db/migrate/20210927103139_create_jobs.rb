class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.integer :salary
      t.datetime :paid_at

      t.timestamps
    end
  end
end
