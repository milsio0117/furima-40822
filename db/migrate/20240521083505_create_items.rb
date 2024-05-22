class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string      :title,           null: false
      t.text        :description,     null: false
      t.integer     :price,           null: false
      t.references  :user,            null: false, foreign_key: true
      t.integer     :category_id,     null: false
      t.integer     :status_id,       null: false
      t.integer     :Postage_payerid, null: false
      t.integer     :shipping_day_id, null: false
      t.integer     :prefecture_id,   null: false
      t.timestamps
    end
  end
end
