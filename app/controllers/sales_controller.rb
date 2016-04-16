class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def edit
  end

  def create
    # @sale = Sale.new(sale_params)
    file_formats = ['.txt']
    file = params[:sale][:file_data]

    if file_formats.include? File.extname(file.filename)
      @total_sales_cash = Sale.import(file)
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

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
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
