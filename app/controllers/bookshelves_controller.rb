class BookshelvesController < ApplicationController
  before_action :set_bookshelf, only: [:show, :edit, :update, :destroy]

  def index
    #@bookshelves = Bookshelf.all
  end

  def show
  end

  def new
    @bookshelf = Bookshelf.new
    @bookshelf.build_user
  end

  def edit
  end

  def create
    @bookshelf = Bookshelf.new(bookshelf_params)
    @bookshelf.user_id = current_user.id

    respond_to do |format|
      if @bookshelf.save
        format.html { redirect_to @bookshelf, notice: 'Bookshelf was successfully created.' }
        format.json { render :show, status: :created, location: @bookshelf }
      else
        format.html { render :new }
        format.json { render json: @bookshelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params[:bookshelf][:book_ids] ||= []
    respond_to do |format|
      if @bookshelf.update(bookshelf_params)
        format.html { redirect_to @bookshelf, notice: 'Bookshelf was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookshelf }
      else
        format.html { render :edit }
        format.json { render json: @bookshelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookshelf.destroy
    respond_to do |format|
      format.html { redirect_to bookshelves_url, notice: 'Bookshelf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bookshelf
      @bookshelf = Bookshelf.find(params[:id])
    end

    def bookshelf_params
      params.require(:bookshelf).permit(:name, :user_id, {:book_ids => []}, :user_attributes => [:email, :id])
    end
end
