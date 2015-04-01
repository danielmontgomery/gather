class AddRecipientIdIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :recipient_id_id, :integer
  end
end
