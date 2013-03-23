class JudgesController < ApplicationController
  before_action :filter_show_judge, only: [:show]
  before_action :set_judge, only: [:show]

  # GET /judges/1
  # GET /judges/1.json
  def show
  end

  # GET /judges/new
  def new
    @judge = Judge.new
  end

  # POST /judges
  # POST /judges.json
  def create
    @judge = Judge.new(judge_params)

    respond_to do |format|
      if @judge.save
        format.html #{ redirect_to @judge, notice: 'Judge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @judge }
      else
        format.html { render action: 'new' }
        format.json { render json: @judge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def filter_show_judge
      @judge = Judge.find_by_id(params[:id])
      if @judge.nil?
        render :status => 404
        return
      elsif @judge.judging?
        render "judges/wait"
        return
      elsif @judge.judged?
        # success
      else
        render :status => 404
        return
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_judge
      @judge = Judge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def judge_params
      params.require(:judge).permit(:title, :select_type, :judge_type, :judge_time, :remove_time)
    end
end
