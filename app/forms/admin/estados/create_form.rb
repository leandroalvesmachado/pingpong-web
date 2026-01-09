class Admin::Estados::CreateForm < ApplicationForm
  attribute :nome, :string

  validates :nome, presence: true

  def to_attributes
    {
      nome: nome
    }
  end

  def submit
    return false unless valid?

    true
  end
end
