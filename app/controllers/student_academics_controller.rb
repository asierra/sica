class StudentAcademicsController < ApplicationController
  before_action :set_student_academic, only: [:show, :edit, :update, :destroy]

  # GET /student_academics
  # GET /student_academics.json
  def index
    @student_academics = StudentAcademic.all
  end

  # GET /student_academics/1
  # GET /student_academics/1.json
  def show
  end

  # GET /student_academics/new
  def new
    @student_academic = StudentAcademic.new
  end

  # GET /student_academics/1/edit
  def edit
  end

  # POST /student_academics
  # POST /student_academics.json
  def create
    @student_academic = StudentAcademic.new(student_academic_params)

    respond_to do |format|
      if @student_academic.save
        format.html { redirect_to @student_academic, notice: 'Student academic was successfully created.' }
        format.json { render :show, status: :created, location: @student_academic }
      else
        format.html { render :new }
        format.json { render json: @student_academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_academics/1
  # PATCH/PUT /student_academics/1.json
  def update
    respond_to do |format|
      if @student_academic.update(student_academic_params)
        format.html { redirect_to @student_academic, notice: 'Student academic was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_academic }
      else
        format.html { render :edit }
        format.json { render json: @student_academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_academics/1
  # DELETE /student_academics/1.json
  def destroy
    @student_academic.destroy
    respond_to do |format|
      format.html { redirect_to student_academics_url, notice: 'Student academic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_academic
      @student_academic = StudentAcademic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_academic_params
      params.require(:student_academic).permit(:student_id, :academic_id, :activity_id)
    end
end
