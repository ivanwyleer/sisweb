class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customers = Array.new
      Customer.search(params[:search]).each do |customer|
      if customer.role_id == 1
        @customers << customer
      end
      end
    
    respond_with(@customers)
  end

  def show
    respond_with(@customer)
  end

  def new
    @customer = Customer.new
    respond_with(@customer)
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.role_id = 1
    @customer.save
    flash[:notice] = 'Cadastro realizado com sucesso!'
    respond_with(@customer) 
  end

  def update
    @customer.update(customer_params)
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:email, :password, :nome, :endereco, :telcelular, :telfixo, :operadora_celular, :operadora_fixo, :role_id)
    end
end