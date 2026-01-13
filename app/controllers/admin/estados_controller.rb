class Admin::EstadosController < AdminController
  def index
    query = Admin::Estados::SearchQuery.new(params).call
    @pagy, @estados = pagy(query)
  end

  def new
    @form = Admin::Estados::CreateForm.new
  end

  def create
    @form = Admin::Estados::CreateForm.new(estado_params)
    result = Admin::Estados::CreateService.call(@form)

    if result.success?
      redirect_to admin_estados_path, notice: "Estado criado com sucesso"
    else
      flash.now[:alert] = result.error if result.error
      render :new, status: :unprocessable_entity
    end
  end

  private

  def estado_params
    params
      .require(:admin_estados_create_form)
      .permit(:nome)
  end
end
