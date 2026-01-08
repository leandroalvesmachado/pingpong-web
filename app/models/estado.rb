class Estado < ApplicationRecord
  self.table_name = "estados"

  belongs_to :pais, class_name: "Pais", foreign_key: "pais_id"
end
