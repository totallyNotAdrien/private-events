class EventConfirmationsController < ApplicationController
  before_action :set_event_confirmation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /event_confirmations or /event_confirmations.json
  def index
    @event_confirmations = EventConfirmation.all
  end

  # GET /event_confirmations/1 or /event_confirmations/1.json
  def show
  end

  # GET /event_confirmations/new
  def new
    @event_confirmation = current_user.event_confirmations.build
  end

  # GET /event_confirmations/1/edit
  def edit
  end

  # POST /event_confirmations or /event_confirmations.json
  def create
    #params[:attendee_id] = current_user.id
    #params.merge(attendee_id: current_user.id)
    #@event_confirmation = current_user.event_confirmations.build(event_confirmation_params)
    @event_confirmation = current_user.event_confirmations.build(attendee_id: current_user.id, event_id: params[:event_id])

    respond_to do |format|
      if @event_confirmation.save
        format.html { redirect_to event_path(@event_confirmation.event), notice: "You successfully joined this event." }
        format.json { render :show, status: :created, location: @event_confirmation }
      else
        #format.html { render :new, status: :unprocessable_entity }
        format.html { redirect_to root_path, alert: "Failed to join event" }
        format.json { render json: @event_confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_confirmations/1 or /event_confirmations/1.json
  def update
    respond_to do |format|
      if @event_confirmation.update(event_confirmation_params)
        format.html { redirect_to event_confirmation_url(@event_confirmation), notice: "Event confirmation was successfully updated." }
        format.json { render :show, status: :ok, location: @event_confirmation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_confirmations/1 or /event_confirmations/1.json
  def destroy
    @event_confirmation.destroy

    respond_to do |format|
      format.html { redirect_to event_confirmations_url, notice: "Event confirmation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_confirmation
      @event_confirmation = EventConfirmation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_confirmation_params
      #params.fetch(:event_confirmation, {}).permit(:event_id, :attendee_id)
      params.require(:event_confirmation).permit(:event_id, :attendee_id)
    end
end
