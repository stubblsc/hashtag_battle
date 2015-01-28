class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :update, :destroy, :stream]

  helper_method :sort_column, :sort_direction

  # GET /battles
  # GET /battles.json
  def index
    #kills all tweet streaming processes
    system "pkill -f stream_tweets"

    @battles = Battle.search(params[:search]).order(sort_column + " " + sort_direction)
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
    #kills all tweet streaming processes
    system "pkill -f stream_tweets"
  end

  # GET /battles/new
  def new
    #kills all tweet streaming processes
    system "pkill -f stream_tweets"

    @battle = Battle.new
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)

    if @battle.save
      redirect_to battles_stream_path(@battle.id), notice: 'Battle was successfully created.'
    else
      render :new
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_path, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #live streams tweets for hashtags and counts for the hashtags
  def stream
    #kills all tweet streaming processes
    #system "pkill -f stream_tweets"

    #invokes rake task for streaming tweets for 2 different brands
    system "rake stream_tweets BRAND1=#{@battle.brand1} BRAND2=#{@battle.brand2} BATTLE_ID=#{@battle.id} &"
  end

  #loads scripts to refresh updates to tweets and counts when streaming
  def update
    #formats as js since it's getting parsed on the front end
    respond_to do |format|
      format.js
    end
  end

  private
    #allow sorting battles by column
    def sort_column
      Battle.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    #allow forward and reverse sorting
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.require(:battle).permit(:brand1, :brand2)
    end
end
