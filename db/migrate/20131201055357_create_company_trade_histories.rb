class CreateCompanyTradeHistories < ActiveRecord::Migration
  def change
    create_table :company_trade_histories do |t|
      t.integer :company_id
      t.date :date
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.float :adjusted_close
      t.integer :volume
      t.float :sma_50
      t.float :sma_100
      t.float :sma_200

      t.timestamps
    end
    add_index :company_trade_histories, [:id, :date], :unique => true
    add_index :company_trade_histories, :company_id
    add_index :company_trade_histories, :open
    add_index :company_trade_histories, :high
    add_index :company_trade_histories, :low
    add_index :company_trade_histories, :close
    add_index :company_trade_histories, :adjusted_close
    add_index :company_trade_histories, :volume
    add_index :company_trade_histories, :sma_50
    add_index :company_trade_histories, :sma_100
    add_index :company_trade_histories, :sma_200
  end
end
