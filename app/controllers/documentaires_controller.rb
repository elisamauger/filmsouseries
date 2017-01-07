class DocumentairesController < ApplicationController
  before_action :set_documentaire, only: [:show, :edit, :update, :destroy, :set_checked]
  before_action :authorize

  # GET /documentaires
  # GET /documentaires.json
  def index
    @documentaires = Documentaire.all
  end

  # GET /documentaires/1
  # GET /documentaires/1.json
  def show
  end

  # GET /documentaires/new
  def new
    @documentaire = Documentaire.new
  end

  # GET /documentaires/1/edit
  def edit
  end

  # POST /documentaires
  # POST /documentaires.json
  def create
    @documentaire = Documentaire.new(documentaire_params)

    respond_to do |format|
      if @documentaire.save
        format.html { redirect_to @documentaire, notice: 'Documentaire was successfully created.' }
        format.json { render :show, status: :created, location: @documentaire }
      else
        format.html { render :new }
        format.json { render json: @documentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentaires/1
  # PATCH/PUT /documentaires/1.json
  def update
    respond_to do |format|
      if @documentaire.update(documentaire_params)
        format.html { redirect_to @documentaire, notice: 'Documentaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @documentaire }
      else
        format.html { render :edit }
        format.json { render json: @documentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentaires/1
  # DELETE /documentaires/1.json
  def destroy
    @documentaire.destroy
    respond_to do |format|
      format.html { redirect_to documentaires_url, notice: 'Documentaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentaire
      @documentaire = Documentaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documentaire_params
      params.require(:documentaire).permit(:nom, :realisateur)
    end
end

 def set_checked
    @documentaires.checked = params[:checked] == 'true' ? true : false
    @documentaires.save
    respond_to do |format|
      format.json { render json: {status: true, checked: @documentaires.checked} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentaires
      @documentaires = documentaires.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documentaires_params
      params.require(:documentaires).permit(:nom, :realisateur, :date, :checked)
    end
