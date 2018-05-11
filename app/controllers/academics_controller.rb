class AcademicsController < ApplicationController
  before_action :set_academic, only: [:show, :edit, :update, :destroy]

  # GET /academics
  # GET /academics.json
  def index
    @academics = Academic.paginate(:page => params[:page], :per_page => 15).order('name ASC')
  end

  # GET /academics/1
  # GET /academics/1.json
  def show
  end

  # GET /academics/new
  def new
    @academic = Academic.new
  end

  # GET /academics/1/edit
  def edit
  end

  # POST /academics
  # POST /academics.json
  def create
    @academic = Academic.new(academic_params)

    respond_to do |format|
      if @academic.save
        format.html { redirect_to @academic, notice: 'Academic was successfully created.' }
        format.json { render :show, status: :created, location: @academic }
      else
        format.html { render :new }
        format.json { render json: @academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academics/1
  # PATCH/PUT /academics/1.json
  def update
    respond_to do |format|
      if @academic.update(academic_params)
        format.html { redirect_to @academic, notice: 'Academic was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic }
      else
        format.html { render :edit }
        format.json { render json: @academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academics/1
  # DELETE /academics/1.json
  def destroy
    @academic.destroy
    respond_to do |format|
      format.html { redirect_to academics_url, notice: 'Academic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic
      @academic = Academic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_params
      params.require(:academic).permit(:name, :account)
    end
end
