class Api::V1::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :json


  # GET /api/v1/books
  # GET /api/v1/books.json
  def index
    @books = Book.all
    books = {"books" => books}

    respond_with books
  end

  # GET /api/v1/books/1
  # GET /api/v1/books/1.json
  def show
    book = {"book" => book }

    respond_with book
  end

  # POST /api/v1/books
  # POST /api/v1/books.json
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: {"book" => @book}, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/books/1
  # PATCH/PUT /api/v1/books/1.json
  def update
    if @book.update(book_params)
      render json: {"book" => @book}, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/1
  # DELETE /api/v1/books/1.json
  def destroy
    @book.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description, :author_id, :user_id)
    end
end
