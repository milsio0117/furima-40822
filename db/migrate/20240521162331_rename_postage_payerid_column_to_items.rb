class RenamePostagePayeridColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :Postage_payerid, :postage_payer_id
  end
end
