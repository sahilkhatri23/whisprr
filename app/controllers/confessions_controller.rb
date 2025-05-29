class ConfessionsController < ApplicationController
  PER_PAGE = 21

  def index
    @confessions = Confession.order(created_at: :desc).page(params[:page]).per(PER_PAGE)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @confession = Confession.new
  end

  def create
    @confession = Confession.new(confession_params)

    if @confession.save
      @confessions = Confession.order(created_at: :desc).page(1).per(PER_PAGE)
      
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to confessions_path, notice: "Confession created!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def confession_params
    params.require(:confession).permit(:body)
  end
end