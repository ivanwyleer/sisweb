class ProfessionalsController < ApplicationController
  before_action :set_professional, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @professionals = Professional.all
    @professionals = Professional.search(params[:search]).order(created_at: :desc).paginate(:per_page => 2, :page => params[:page])
    respond_with(@professionals)
  end

  def show
    respond_with(@professional)
  end

  def new
    @professional = Professional.new
    respond_with(@professional)
  end

  def edit
  end

  def create
    @professional = Professional.new(professional_params)
    @professional.save
    respond_with(@professional)
  end

  def update
    @professional.update(professional_params)
    respond_with(@professional)
  end

  def destroy
    @professional.destroy
    respond_with(@professional)
  end

  private
    def set_professional
      @professional = Professional.find(params[:id])
    end

    def professional_params
      params.require(:professional).permit(:name, :specialty)
    end
end
