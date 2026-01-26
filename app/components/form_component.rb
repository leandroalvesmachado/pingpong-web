# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :form, :url, :method, :model, :back_url, :submit_text, :form_builder

  def initialize(
    title:,
    subtitle:,
    form:,
    url:,
    method: :post,
    model: nil,
    back_url: nil,
    submit_text: nil
  )
    @title = title
    @subtitle = subtitle
    @form = form
    @url = url
    @method = method
    @model = model
    @back_url = back_url
    @submit_text = submit_text
  end
end
