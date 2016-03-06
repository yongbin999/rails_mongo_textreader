class NewFilesController < ApplicationController
  before_action :set_new_file, only: [:show, :edit, :update, :destroy]

  # GET /new_files
  # GET /new_files.json
  def index
    @new_files = NewFile.all
  end

  # GET /new_files/1
  # GET /new_files/1.json
  def show
  end

  # GET /new_files/new
  def new
    @new_file = NewFile.new
  end

  # GET /new_files/1/edit
  def edit
  end

  # POST /new_files
  # POST /new_files.json
  def create
    @new_file = NewFile.new(new_file_params)

    respond_to do |format|
      if @new_file.save
        format.html { redirect_to @new_file, notice: 'New file was successfully created.' }
        format.json { render :show, status: :created, location: @new_file }
      else
        format.html { render :new }
        format.json { render json: @new_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_files/1
  # PATCH/PUT /new_files/1.json
  def update
    respond_to do |format|
      if @new_file.update(new_file_params)
        format.html { redirect_to @new_file, notice: 'New file was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_file }
      else
        format.html { render :edit }
        format.json { render json: @new_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_files/1
  # DELETE /new_files/1.json
  def destroy
    @new_file.destroy
    respond_to do |format|
      format.html { redirect_to new_files_url, notice: 'New file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # remove all old files and add new one
   def import
    NewFile.all.destroy_all
    NewFile.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_file
      @new_file = NewFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_file_params
      params.require(:new_file).permit(:fileid, :line, :content,)
    end

end
