class Admin::EstadoController < AdminController
  def index
    @estados = @estado_repository.paginate(params).decorate
    @pagy, @estados = pagy(@estados)
  end
end
