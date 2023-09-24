class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
      @genre = params[:genre]
      @search_type = params[:search]
      @search_word = params[:word]
      
      @posts = Post.looks(params[:search], params[:word], params[:genre])
      render "/searches/search_result"
    end

end
