class AddPhoneAndEmailToParent < ActiveRecord::Migration
  def change
    add_column :parents, :email, :string

    add_column :parents, :phone, :string
    add_column :parents, :phone_has_sms, :boolean

  end
end
