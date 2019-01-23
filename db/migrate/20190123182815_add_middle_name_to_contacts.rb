class AddMiddleNameToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :middle_name, :string, default: "Hannah"
  end
end
