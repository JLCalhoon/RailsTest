class VictoriesController < ApplicationController
  before_action :set_victory, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: %i[ edit update destroy react_thumb react_heart react_cool react_crazy ]
  before_action :check_user, only: %i[ edit update destroy ]
  before_action :check_reaction, only: %i[ react_thumb react_heart react_cool react_crazy]

  # GET /victories or /victories.json
  def index
    @victories = Victory.all
  end

  # GET /victories/1 or /victories/1.json
  def show
  end

  # GET /victories/new
  def new
    @victory = current_user.victories.build
  end

  # GET /victories/1/edit
  def edit
  end

  # POST /victories or /victories.json
  def create
    #@victory = Victory.new(victory_params)
    @victory = current_user.victories.build(victory_params)
    @victory.victory_id = SecureRandom.uuid
    @victory.heart = 0
    @victory.thumb = 0
    @victory.cool = 0
    @victory.crazy = 0
    @victory.react_tracker = ""

    respond_to do |format|
      if @victory.save
        format.html { redirect_to victory_url(@victory), notice: "Victory was successfully created." }
        format.json { render :show, status: :created, location: @victory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @victory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /victories/1 or /victories/1.json
  def update
    respond_to do |format|
      if @victory.update(victory_params)
        format.html { redirect_to victory_url(@victory), notice: "Victory was successfully updated." }
        format.json { render :show, status: :ok, location: @victory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @victory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /victories/1 or /victories/1.json
  def destroy
    @victory.destroy

    respond_to do |format|
      format.html { redirect_to victories_url, notice: "Victory was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def react_heart
    @victory = Victory.all.find(params[:id])
    @victory.heart += 1
    @victory.react_tracker += " "+current_user.id.to_s
    if @victory.save
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @victory.errors, status: :unprocessable_entity }
    end
  end
  def react_thumb
    @victory = Victory.all.find(params[:id])
    @victory.thumb += 1
    @victory.react_tracker += " "+current_user.id.to_s
    if @victory.save
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @victory.errors, status: :unprocessable_entity }
    end
  end
  def react_cool
    @victory = Victory.all.find(params[:id])
    @victory.cool += 1
    @victory.react_tracker += " "+current_user.id.to_s
    if @victory.save
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @victory.errors, status: :unprocessable_entity }
    end
  end
  def react_crazy
    @victory = Victory.all.find(params[:id])
    @victory.crazy += 1
    @victory.react_tracker += " "+current_user.id.to_s
    if @victory.save
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @victory.errors, status: :unprocessable_entity }
    end
  end

  def check_user
    @victory = current_user.victories.find_by(params[:id])
  end

  def authenticate_user
    unless current_user
      flash[:notice] = "You must be logged in to react to, create, edit, update or delete victories"
      redirect_to new_user_session_url
      return false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_victory
      @victory = Victory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def victory_params
      params.require(:victory).permit(:title, :content, :user_id)
    end

    def check_reaction
      @victory = Victory.find(params[:id])
      list = @victory.react_tracker.split(" ")
      if list.include? current_user.id.to_s
        flash[:error] = "You have already reacted to this victory"
        redirect_back(fallback_location: root_path)
      end
    end
end
