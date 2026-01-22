# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  def initialize(
    form:,
    url:,
    method: :post
  )
    @form = form
    @url = url
    @method = method
  end
end
