class SearchesController < ApplicationController

  def search
    @genre = params[:genre]
    @search_type = "partial_match"
    @search_word = params[:word]

    @posts = Post.looks("partial_match", params[:word], params[:genre])
    render "/searches/search_result"
  end

end
