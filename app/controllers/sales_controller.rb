class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    file_format = ['.txt']
    file = params[:sale][:file_data]

    if file_format.include? File.extname(file.original_filename)
      @total_cash = Sale.read_file(file)
      flash.notice = "File imported."
    else
      flash.notice = "Can't import file."
    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'File was successfully imported.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:file_data)
    end
end
