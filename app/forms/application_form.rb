class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Validations::Callbacks

  before_validation :strip_strings

  def self.from_model(model)
    new(model.attributes.slice(*attribute_names))
  end

  private

  def strip_strings
    self.class.attribute_names.each do |attr|
      value = public_send(attr)
      public_send("#{attr}=", value.strip) if value.is_a?(String)
    end
  end
end
