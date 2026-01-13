class Admin::Estados::CreateForm < ApplicationForm
  attribute :nome, :string

  validates :nome, presence: true

  def to_attributes
    {
      nome: nome
    }
  end
end
