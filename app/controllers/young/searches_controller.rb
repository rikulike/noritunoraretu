class Young::SearchesController < ApplicationController
  before_action :authenticate_young_user!
  
  def search
    @model= params[:model]
    @content= params[:content]
    @method= params[:method]
    if @model == 'user'
      @records= YoungUser.search_for(@content, @method)
    else
      @records= WisdomPost.search_for(@content, @method)
    end
  end
end
