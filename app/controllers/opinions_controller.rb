class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all.order(created_at: :desc)
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    if @opinion.save
      redirect_to opinions_url, notice: 'Opinion successfully posted!'
    else
      render :new, notice: 'Opinion not posted. Try again.'
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    if @opinion.destroy
      redirect_to root_path, notice: 'Opinion deleted!'
    else
      redirect_to @opinion, notice: "Opinion couldn't be deleted."
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
