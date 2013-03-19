class SubmitsController < ApplicationController
  before_filter :filter_submit

  # GET /submits/new
  def new
    @submit = Submit.new
  end

  # POST /submits
  # POST /submits.json
  def create
    @submit = Submit.new(submit_params)

    respond_to do |format|
      if @submit.save
        format.html { redirect_to @submit, notice: 'Submit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @submit }
      else
        format.html { render action: 'new' }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def filter_submit
      @judge = Judge.find_by_id(params[:judge_id])
      if @judge.nil?
        render :status => 404
        return
      elsif @judge.judging?
        # success
      elsif @judge.judged?
        render "submits/deadline"
        return
      else
        render :status => 404
        return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      params.require(:submit).permit()
    end
end
