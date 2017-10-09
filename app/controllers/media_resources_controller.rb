class MediaResourcesController < ApplicationController
  def new
    @media_resource = MediaResource.new
  end

  def create
    @media_resource = MediaResource.new(media_resource_params)
    if @media_resource.save
      redirect_to media_resource_path(@media_resource)
    else
      render 'new'
    end
  end

  private

    def media_resource_params
      params.require(:media_resource).permit(:name, :description, :url, :fields => [])
    end
end
