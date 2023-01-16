class SrctypesController < ApplicationController
  before_action :set_srctype, only: %i[ show edit update destroy ]

  # GET /srctypes or /srctypes.json
  def index
    @srctypes = Srctype.all
  end

  # GET /srctypes/1 or /srctypes/1.json
  def show
  end

  # GET /srctypes/new
  def new
    @srctype = Srctype.new
  end

  # GET /srctypes/1/edit
  def edit
  end

  # POST /srctypes or /srctypes.json
  def create
    @srctype = Srctype.new(srctype_params)

    respond_to do |format|
      if @srctype.save
        format.html { redirect_to srctype_url(@srctype), notice: "Srctype was successfully created." }
        format.json { render :show, status: :created, location: @srctype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @srctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /srctypes/1 or /srctypes/1.json
  def update
    respond_to do |format|
      if @srctype.update(srctype_params)
        format.html { redirect_to srctype_url(@srctype), notice: "Srctype was successfully updated." }
        format.json { render :show, status: :ok, location: @srctype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @srctype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /srctypes/1 or /srctypes/1.json
  def destroy
    @srctype.destroy

    respond_to do |format|
      format.html { redirect_to srctypes_url, notice: "Srctype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_srctype
      @srctype = Srctype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def srctype_params
      params.require(:srctype).permit(:name)
    end
end
