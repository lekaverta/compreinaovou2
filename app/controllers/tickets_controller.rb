class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :get_events, only: [:new, :edit]

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @errors = []

    unless @ticket.event_id?
      event = Event.new(event_params)
      if (event.save)
        @ticket.event_id = event.id
      else
        @errors = event.errors
      end
    end

    respond_to do |format|
      if @errors.empty? &&
         @ticket.save
        format.html { redirect_to @ticket.event, notice: 'Ingresso(s) anunciado(s) com sucesso.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        @errors = @ticket.errors unless @ticket.errors.empty?
        get_events
        format.html { render :new }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket.event, notice: 'Ingresso(s) atualizado(s) com sucesso.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        get_events
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:description, :quantity, :value, :email, :active, :profiles, :event_id)
    end

    def event_params
      params.require(:event).permit(:name, :date, :city, :state, :country, :image)
    end


    def get_events
      @events = Event.all.next
    end
end
