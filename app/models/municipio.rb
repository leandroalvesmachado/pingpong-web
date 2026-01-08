class Municipio < ApplicationRecord
  self.table_name = "municipios"

  belongs_to :estado, class_name: "Estado", foreign_key: "estado_id"
end
