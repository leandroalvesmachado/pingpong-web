class CreateAdminTestes < ActiveRecord::Migration[8.1]
  def change
    create_table :admin_testes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
