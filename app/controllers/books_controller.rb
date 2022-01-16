class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  def create
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行

     if @book.save
      redirect_to book_path(@book.id) , notice: 'Book was successfully created.'
     else
      @books = Book.all
      flash[:alert] = '2 errors prohibited this book from being saved:'
      render 'index'
     end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

     if @book.save
      redirect_to book_path(@book.id) , notice: 'Book was successfully created.'
     else
      @books = Book.all
      flash[:alert] = '2 errors prohibited this book from being saved:'
      render 'edit'
     end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end
end