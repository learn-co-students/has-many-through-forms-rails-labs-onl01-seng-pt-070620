class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @post = Post.find(params[:id])
  end
end
