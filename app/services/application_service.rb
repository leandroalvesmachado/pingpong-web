class ApplicationService
  Result = Struct.new(:success?, :data, :error, keyword_init: true) do
    def failure?
      !success?
    end
  end

  def self.call(*args)
    new(*args).call
  end

  private

  def success(data = nil)
    Result.new(success?: true, data: data)
  end

  def failure(error)
    Result.new(success?: false, error: error)
  end
end
