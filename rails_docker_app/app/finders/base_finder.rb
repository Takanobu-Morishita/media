class BaseFinder
  def initialize(q, scope=nil)
    @q = q
    @scope = scope
  end

  def like_search_condition(scope, column, words, operator="or")
    search_sql = words.size.times.map{ "#{column} like ?" }
    search_words = words.map{ |word| ("%#{ActiveRecord::Base.sanitize_sql_like(word)}%") }
    scope = scope.where(search_sql.join(" #{operator} "), *search_words)
    scope
  end

  def split_freewords(keyword)
    keyword.split(/\,|\、|，/)
  end
end