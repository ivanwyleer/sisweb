class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @workers = Array.new
      Worker.search(params[:search]).each do |worker|
      if worker.role_id == 2
        @workers << worker
      end
      end

    respond_with(@workers)
  end

  def show
    respond_with(@worker)
  end

  def new
    @worker = Worker.new
    respond_with(@worker)
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.role_id = 2
    @worker.save
    flash[:notice] = 'Cadastro realizado com sucesso!'
    respond_with(@worker) 
  end

  def update
    @worker.update(worker_params)
    respond_with(@worker)
  end

  def destroy
    @worker.destroy
    respond_with(@worker)
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:email, :password, :nome, :endereco, :telcelular, :telfixo, :operadora_celular, :operadora_fixo, :role_id)
    end
end