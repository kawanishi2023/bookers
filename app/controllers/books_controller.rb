class BooksController < ApplicationController
  
def index
    @lists = Book.all
    @list = Book.new
  end


  def create
     @list = Book.new(check)
  if @list.save
     flash[:notice] = "【successfully：投稿が成功しました】"
     redirect_to book_path(@list.id)
  else
     @lists=Book.all
     render:index
  end
  end



  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    @list=Book.find(params[:id])
 if @list.update(check)
    flash[:notice] = "【successfully：投稿を更新しました】"
    redirect_to book_path(@list.id)
 else
    render:edit
  end
end

  def destroy
    list=Book.find(params[:id])
    list.destroy
    flash[:notice] = "【successfully：投稿を削除しました】"
    redirect_to '/books'
  end

  private
  def check
    params.require(:book).permit(:title,:body)
  end
end
