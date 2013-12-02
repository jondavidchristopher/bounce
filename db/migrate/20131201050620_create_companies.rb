class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :name

      t.timestamps
    end
    add_index :companies, :ticker, unique: true
  end
end
