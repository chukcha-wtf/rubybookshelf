class Api::V1::BooksController < ApplicationController
  include RoleCheck

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :json


  def index
    @books = Book.where(query_params).page(page_params[:page]).per(page_params[:per_page])
    books = {"books" => @books}
    books["meta"] = {"total_entries" => @books.total_count, "total_pages" => @books.total_pages, "current_page" => @books.current_page }

    respond_with books
  end

  def show
    book = {"book" => @book }

    respond_with book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: {"book" => @book}, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.can_update?(@book)
      if @book.update(book_params)
        render json: {"book" => @book}, status: :created
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    else
      render_permission_denied
    end
  end

  def destroy
    if current_user.can_update?(@book)
      @book.destroy
      head :no_content
    else
      render_permission_denied
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :author_id, :user_id)
    end
end
