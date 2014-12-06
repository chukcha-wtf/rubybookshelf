class Api::V1::AuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  respond_to :json


  def index
    @authors = Author.where(query_params).page(page_params[:page]).per(page_params[:per_page])
    authors = {"authors" => @authors}
    authors["meta"] = {"total_entries" => @authors.total_count, "total_pages" => @authors.total_pages, "current_page" => @authors.current_page }

    respond_with authors
  end

  def show
    author = {"author" => @author }

    respond_with author
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: {"author" => @author}, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: {"author" => @author}, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
    head :no_content
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:title, :description, :author_id, :user_id)
    end
end
