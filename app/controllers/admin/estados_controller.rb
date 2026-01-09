class Admin::EstadosController < AdminController
  def create
    @form = Admin::Estados::CreateForm.new(estado_params)
  end

  private

  def estado_params
    params.require(:estados_estado_form).permit(:name)
  end
end
