class DraftsController < ApplicationController
  def index
    @drafts = Draft.all.map { |d| File.basename(d, '.markdown') }
  end

  def show
    @draft = params[:name]
  end

  def save
    @draft = params[:name]
    @content = params[:content]
    Draft.new(@draft).save(@content)
    respond_to do |format|
      format.json { render json: {success: true} }
    end
  end
end
