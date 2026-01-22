# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  def initialize(icon: nil, title: nil, breadcrumbs: [])
    @icon = icon
    @title = title
    @breadcrumbs = breadcrumbs
  end
end
