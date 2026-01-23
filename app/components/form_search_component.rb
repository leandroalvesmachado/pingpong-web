# frozen_string_literal: true

class FormSearchComponent < ViewComponent::Base
  attr_reader :form_builder

  def initialize(
    url:,
    method: :get
  )
    @url = url
    @method = method
  end
end
