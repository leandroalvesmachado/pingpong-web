class ApplicationService
  Result = Struct.new(:success?, :data, :error)

  def self.call(*args)
    new(*args).call
  end

  private

  def success(data = nil)
    Result.new(true, data, nil)
  end

  def failure(error)
    Result.new(false, nil, error)
  end
end
