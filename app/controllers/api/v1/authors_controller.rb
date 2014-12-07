class Api::V1::AuthorsController < ApplicationController
  include RoleCheck
  
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
    @author = current_user.authors.new(author_params)

    if @author.save
      render json: {"author" => @author}, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.can_update?(@book)
      if @author.update(author_params)
        render json: {"author" => @author}, status: :ok
      else
        render json: @author.errors, status: :unprocessable_entity
      end
    else
      render_permission_denied
    end
  end

  def destroy
    if current_user.can_update?(@book)
      @author.destroy
      head :no_content
    else
      render_permission_denied
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:title, :description, :author_id, :user_id)
    end
end
