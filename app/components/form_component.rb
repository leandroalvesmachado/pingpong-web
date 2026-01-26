# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :form, :url, :method

  def initialize(
    title:,
    subtitle:,
    form:,
    url:,
    method: :post
  )
    @title = title
    @subtitle = subtitle
    @form = form
    @url = url
    @method = method
  end
end
