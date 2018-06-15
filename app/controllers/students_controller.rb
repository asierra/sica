#  This file is part of SICA: Sistema de Control de Acceso
#  Copyright (c) 2018  Alejandro Aguilar Sierra (asierra@unam.mx)
#  Centro de Ciencias de la Atmosfera, UNAM
#  License: GNU GPL 3.0

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :new, :create, :show, :show_photo]

  # GET /students
  # GET /students.json
  def index
    if current_user
      @students = Student.paginate(:page => params[:page], :per_page => 5).order('surname_paternal ASC')
      respond_to do |format|
        format.html
        format.csv { send_data Student.all.to_csv, filename: "students-#{Date.today}.csv" }
      end      
    else
      render :layout => 'simple'
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @scholarship = Scholarship.find(@student.scholarship_id).name
    if not current_user
      render :layout => 'simple'
    end
  end
  
  def show_photo
    @student = Student.find(params[:id])
    send_data(@student.photo,
              type: "image/jpeg",
              disposition: "inline")
  end
  
  # GET /students/new
  def new
    @student = Student.new
    render :layout => 'simple' if not current_user
  end

  # GET /students/1/edit
  def edit
  end

  def activate
    @student = Student.find(params[:id])
    if @student
      @student.update_attribute(:status, 1 - @student.status)
      logger.info("Student Status " + @student.status.to_s)
      redirect_back(fallback_location: root_path)
    end
  end
  
  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
#    logger.info("Photo1 " + @student.filephoto.original_filename)
#    logger.info("Photo2 " + @student.filephoto.content_type)
#    @student.photo = @student.filephoto.read
    #    @student.filephoto = @student.filephoto.original_filename
    
    @student.has_course_or_activity = (@course!=nil or @activity!=nil)
    
    if @course
      c = Course.find(@course)
      @student.student_courses.build(:course => c) if c
    end

    if @activity
      act = Activity.find(@activity)
      acad = Academic.find(@academic)
      @student.student_academics.build(:activity => act, :academic => acad) if act and acad
    end

    @student.status = 0
    
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity, notice: 'Se debe elegir un curso o una actividad.' }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      p = params.require(:student).permit(:name, :surname_paternal, :surname_maternal, :account, :email, :institution, :photo, :contact_name, :contact_tel, :status, :filephoto, :course, :scholarship_id, :activity, :academic, :nationality_id, :place_of_birth)

#      logger.info("Scholarship "+p[:scholarship_id])

      if not p[:course].blank?
        @course = p[:course]
      else
        @course = nil
      end      
      p.delete("course")

      if not p[:activity].blank?        
        @activity = p[:activity]
      else
        @activity = nil
      end      
      p.delete("activity")
      
      @academic = p[:academic]
      p.delete("academic")
      p
    end
end
