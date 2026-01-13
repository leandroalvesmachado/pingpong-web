# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  attr_reader :icon, :title, :subtitle, :headers, :records, :pagination

  def initialize(icon: nil, title: nil, subtitle: nil, headers: [], records: [], pagination: nil)
    @icon = icon
    @title = title
    @subtitle = subtitle
    @headers = headers
    @records = records
    @pagination = pagination
  end

  def paginated?
    pagination.present?
  end
end
