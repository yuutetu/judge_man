#coding:utf-8
class ParamsError < StandardError; end

class SubmitsController < ApplicationController
  before_action :filter_submit

  # GET /submits/new
  def new
    @submit = Submit.new
  end

  # POST /submits
  # POST /submits.json
  def create
    unless submit_params[:select_item].present?
      render action: 'new'
    end

    if submit_params[:select_item].to_i < @judge.select_items.count
      @submit = Submit.new(select_item: @judge.select_items[submit_params[:select_item].to_i])
    elsif submit_params[:select_item].to_i == @judge.select_items.count
      @judge.select_items << SelectItem.create(title: submit_params[:select_item_etc])
      @submit = Submit.new(select_item: @judge.select_items[submit_params[:select_item].to_i])
    else
      raise ParamsError, "不正なパラメータです。"
    end

    respond_to do |format|
      if @submit.save
        @judge.submits << @submit
        format.html #{ redirect_to @submit, notice: 'Submit was successfully created.' }
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
        render :nothing => ture, :status => 404
        return
      elsif @judge.judging?
        # success
      elsif @judge.judged?
        render "submits/deadline"
        return
      else
        render :nothing => ture, :status => 404
        return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      params.merge :submit => {:select_item => ""}
      params.require(:submit).permit(:select_item, :select_item_etc)
    end
end
