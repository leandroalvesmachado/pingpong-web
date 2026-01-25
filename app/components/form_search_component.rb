# frozen_string_literal: true

class FormSearchComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :url, :method, :form_search

  def initialize(
    title: nil,
    subtitle: nil,
    url:,
    method: :get
  )
    @title = title
    @subtitle = subtitle
    @url = url
    @method = method
  end
end
