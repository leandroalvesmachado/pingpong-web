class Admin::EstadosController < AdminController
  before_action :set_estado, only: %i[ show edit update destroy ]

  def index
    @form = Admin::Estados::SearchForm.new(params.fetch(:q, {}))
    query = Admin::Estados::SearchQuery.new(@form).call
    @pagy, @estados = pagy(query)
  end

  def show
  end

  def new
    @form = Admin::Estados::CreateForm.new
  end

  def edit
    @form = Admin::Estados::EditForm.from_model(@estado)
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

  def update
    @form = Admin::Estados::EditForm.new(estados_params)
    result = Admin::Estados::UpdateService.call(@form, @estado)

    if result.success?
      redirect_to admin_estados_path, notice: "Estado atualizado com sucesso"
    else
      flash.now[:alert] = result.error
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @estado.destroy
    redirect_to admin_estados_path, notice: "Estado removido com sucesso"
  end

  private

  def set_estado
    @estado = Estado.find(params[:id])
  end

  def estado_params
    params
      .require(:admin_estados_create_form)
      .permit(:nome)
  end

  def estados_params
    params
      .require(:admin_estados_edit_form)
      .permit(:nome)
  end
end
