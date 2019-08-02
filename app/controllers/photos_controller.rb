class PhotosController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :load_idea
  before_action :authorize

  def index
    @photos = Unsplash::Photo.random(query: @idea.title, count: 3) # this returns an array of photos
  end

  def create
    @idea.update_attributes photo_url: params[:photo_url]

    redirect_to edit_idea_path(@idea)
  end

  private

  def load_idea
    @idea = Idea.find(params[:idea_id])
  end

  def authorize
    redirect_to account_path unless can_edit?(@idea)
  end
end
