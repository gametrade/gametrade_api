class CategoriesController < ApplicationController
  def index
    search = Category.ransack(params[:q])
    render template: 'categories/index', locals: { categories: search.result }
  end

  def show
    category = Category.find(params.require(:id))
    render template: 'categories/show', locals: { category: category }
  end
end
