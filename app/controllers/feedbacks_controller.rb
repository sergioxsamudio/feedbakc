class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:new, :create]

  # GET /feedbacks or /feedbacks.json
  def index
    @feedbacks = Feedback.all # O aplicar cualquier filtrado/ordenamiento que necesites

    # Filtrar por empresa
    if params[:company].present?
      @feedbacks = @feedbacks.where(company: params[:company])
    end

    # Filtrar por fecha (creación)
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @feedbacks = @feedbacks.where(created_at: start_date.beginning_of_day..end_date.end_of_day)
    end

    @feedbacks = @feedbacks.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="feedbacks.xlsx"'
        # Rails buscará automáticamente app/views/feedbacks/index.xlsx.axlsx aquí
      end
    end
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to new_feedback_url, notice: "¡Gracias por tu opinión! Tu feedback ha sido guardado." } # Redirigir al formulario para otra encuesta
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feedback.destroy!

    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(
        :first_name, :last_name, :identification_number, :email, :company,
        :enjoyment_experience_rating, :benefit_discovery_rating, :interaction_participation_rating,
        :notes
      )
    end
end
