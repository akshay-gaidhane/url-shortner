class UrlsController < ApplicationController
  before_action :authenticate_user!, except: ["show"]
  before_action :set_domain
  def index
    @urls = current_user.urls
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.user_id = current_user.id

    @url.save
    respond_to do |format|  
      format.js
    end
  end

  def show
    @url = Url.find_by_short_url(params[:id])
    render 'errors/404.html.erb' , status: 404 and return if @url.nil? || @url.expired_at > Time.zone.now
    @url.update_attribute(:click_count, @url.click_count + 1)
    redirect_to @url.source_url
  end

  private
  def url_params
    params.require(:url).permit(:source_url)
  end

  def set_domain
    @base_url = request.base_url
  end
end
