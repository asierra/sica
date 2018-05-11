class StudentScholarshipsController < ApplicationController
  before_action :set_student_scholarship, only: [:show, :edit, :update, :destroy]

  # GET /student_scholarships
  # GET /student_scholarships.json
  def index
    @student_scholarships = StudentScholarship.all
  end

  # GET /student_scholarships/1
  # GET /student_scholarships/1.json
  def show
  end

  # GET /student_scholarships/new
  def new
    @student_scholarship = StudentScholarship.new
  end

  # GET /student_scholarships/1/edit
  def edit
  end

  # POST /student_scholarships
  # POST /student_scholarships.json
  def create
    @student_scholarship = StudentScholarship.new(student_scholarship_params)

    respond_to do |format|
      if @student_scholarship.save
        format.html { redirect_to @student_scholarship, notice: 'Student scholarship was successfully created.' }
        format.json { render :show, status: :created, location: @student_scholarship }
      else
        format.html { render :new }
        format.json { render json: @student_scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_scholarships/1
  # PATCH/PUT /student_scholarships/1.json
  def update
    respond_to do |format|
      if @student_scholarship.update(student_scholarship_params)
        format.html { redirect_to @student_scholarship, notice: 'Student scholarship was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_scholarship }
      else
        format.html { render :edit }
        format.json { render json: @student_scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_scholarships/1
  # DELETE /student_scholarships/1.json
  def destroy
    @student_scholarship.destroy
    respond_to do |format|
      format.html { redirect_to student_scholarships_url, notice: 'Student scholarship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_scholarship
      @student_scholarship = StudentScholarship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_scholarship_params
      params.require(:student_scholarship).permit(:student_id, :scholarship_id)
    end
end
