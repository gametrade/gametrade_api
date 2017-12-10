class ThemesController < ApplicationController
  def index
    search = Theme.ransack(params[:q])
    render template: 'themes/index', locals: { themes: search.result }
  end

  def show
    theme = Theme.find(params.require(:id))
    render template: 'themes/show', locals: { theme: theme }
  end
end
