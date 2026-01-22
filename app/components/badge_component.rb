# frozen_string_literal: true

class BadgeComponent < ViewComponent::Base
  attr_reader :icon, :title, :subtitle, :headers, :records, :pagination

  def initialize(text: nil, color: nil, boolean: nil)
    if !boolean.nil?
      @text  = boolean ? "Ativo" : "Inativo"
      @color = boolean ? "success" : "danger"
    else
      @text  = text
      @color = color || "secondary"
    end
  end
end
