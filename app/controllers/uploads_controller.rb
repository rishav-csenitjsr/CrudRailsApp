class UploadsController < ApplicationController
  before_action :set_image, only: [:show, :edit,:upload, :update, :destroy]
  $down=""
  def download_pdf
    send_file "#{$down}", x_sendfile: true
  end
  def index
    @files = Upload.all
  end

  def show
  end

  def new
    @file = Upload.new
  end

  def edit

  end

  def create
    hi = image_params
    if params[:upload].present?
      file = params[:upload][:picture]
      #byebug
      File.open(Rails.root.join('app','assets', 'images', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end

    path1="app/assets/images/#{file.original_filename}"

    @file=Upload.new({name: hi[:name], filepath: path1, user_id: session[:user_id]})
    $down=@file.filepath

    respond_to do |format|
      if @file.save
        format.html { redirect_to @file, notice: 'File was successfully created.' }
        format.json { render action: 'show', status: :created, location: @file }
        #byebug
      else
        format.html { render action: 'new' }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @file.update(image_params)
        format.html { redirect_to @file, notice: 'File was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @file.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params.require(:upload).permit(:picture)
    File.open(Rails.root.join('public','uploads',uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end


  private
  def set_image
    @file = Upload.find(params[:id])
  end

  def image_params
    #byebug
    params.require(:upload).permit(:name)
  end
end
