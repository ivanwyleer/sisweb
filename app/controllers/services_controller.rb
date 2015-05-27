class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @services = Service.all
    @services = Service.search(params[:search]).order(created_at: :desc).paginate(:per_page => 2, :page => params[:page])
    respond_with(@services)


  end

  def show
    respond_with(@service)
  end

  def new
    @service = Service.new
    respond_with(@service)
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.save
    flash[:notice] = 'Cadastro realizado com sucesso!'
    respond_with(@service) 
  end

  def update
    @service.update(service_params)
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:description, :price)
    end
end
