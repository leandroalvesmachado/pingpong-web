class Admin::TestesController < ApplicationController
  before_action :set_admin_testis, only: %i[ show edit update destroy ]

  # GET /admin/testes or /admin/testes.json
  def index
    @admin_testes = Admin::Teste.all
  end

  # GET /admin/testes/1 or /admin/testes/1.json
  def show
  end

  # GET /admin/testes/new
  def new
    @admin_testis = Admin::Teste.new
  end

  # GET /admin/testes/1/edit
  def edit
  end

  # POST /admin/testes or /admin/testes.json
  def create
    @admin_testis = Admin::Teste.new(admin_testis_params)

    respond_to do |format|
      if @admin_testis.save
        format.html { redirect_to @admin_testis, notice: "Teste was successfully created." }
        format.json { render :show, status: :created, location: @admin_testis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_testis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/testes/1 or /admin/testes/1.json
  def update
    respond_to do |format|
      if @admin_testis.update(admin_testis_params)
        format.html { redirect_to @admin_testis, notice: "Teste was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_testis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_testis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/testes/1 or /admin/testes/1.json
  def destroy
    @admin_testis.destroy!

    respond_to do |format|
      format.html { redirect_to admin_testes_path, notice: "Teste was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_testis
      @admin_testis = Admin::Teste.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_testis_params
      params.expect(admin_testis: [ :nome ])
    end
end
