# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :target, :model, :size

  def initialize(title: nil, subtitle: nil, target: nil, model: nil, size: :xl)
    @title = title
    @subtitle = subtitle
    @target = target
    @model = model
    @size = size
  end
end
