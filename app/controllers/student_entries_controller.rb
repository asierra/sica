class StudentEntriesController < ApplicationController
  before_action :set_student_entry, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :paso]

  # GET /student_entries
  # GET /student_entries.json
  def index
    if current_user
      @student_entries = StudentEntry.paginate(:page => params[:page], :per_page => 10).order('id DESC')

      respond_to do |format|
        format.html
        format.csv { send_data StudentEntry.all.to_csv, filename: "entradas-#{Date.today}.csv" }
      end
    else
      redirect_to action: "paso"
    end
  end

  # GET /student_entries/1
  # GET /student_entries/1.json
  def show
    @student = @student_entry.student
  end

  def paso
    unless params[:search].nil?
      @number_read = params[:search][0..8]      
      @student  = Student.find_by_account(@number_read)
      if @student and @student.status==1
        student_entry = StudentEntry.new(:student => @student, :entry => Time.now)
        logger.info("Student " + @student.name+" : "+@entry.to_s)
        student_entry.save
      else
        @student = nil
      end
    else
      @student = nil
    end
    render :layout => 'simple'
  end
  
  # GET /student_entries/new
  def new
  end

  # GET /student_entries/1/edit
  def edit
  end

  # POST /student_entries
  # POST /student_entries.json
  def create
  end

  # PATCH/PUT /student_entries/1
  # PATCH/PUT /student_entries/1.json
  # update no debe modificar el registro de entrada anterior,
  # debe comportarse como si fuera un dato nuevo
  def update
  end
  
  # DELETE /student_entries/1
  # DELETE /student_entries/1.json
  def destroy
    @student_entry.destroy
    respond_to do |format|
      format.html { redirect_to student_entries_url, notice: 'Student entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_entry
      @student_entry = StudentEntry.find(params[:id])
    end
end
