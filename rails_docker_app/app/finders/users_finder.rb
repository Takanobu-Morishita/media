class UsersFinder < BaseFinder
  def execute
    return User.none if @scope.blank?

    @scope
  end

  private

    def search_store_name
      return if @q.store_name.blank?

      words = split_freewords(@q.store_name)

      # usersテーブルに紐づくstoresテーブルのnameを検索したい場合は、controller側で事前にeager_loadを設定します
      @scope = like_search_condition(@scope, "stores.name", words)
    end

    def search_department
      return if @q.department.blank?

      words = split_freewords(@q.department)

      @scope = like_search_condition(@scope, "department", words)
    end

    def search_statuses
      return if @q.statuses.blank?

      @scope = @scope.where(status: @q.statuses)
    end

    def search_roles
      return if @q.roles.blank?

      @scope = @scope.where(role: @q.roles)
    end

    def search_name
      return if @q.name.blank?

      words = split_freewords(@q.name)

      # first_nameとlast_name、どちらが一致しても検索結果に含まれるよう検索します
      @scope = like_search_condition(@scope, "first_name", words)
                 .or(like_search_condition(@scope, "last_name", words))
                 .or(like_search_condition(@scope, 'CONCAT(users.last_name, users.first_name)', words))
    end

    def search_name_kana
      return if @q.name_kana.blank?

      words = split_freewords(@q.name_kana)

      @scope = like_search_condition(@scope, "first_name_kana", words)
                 .or(like_search_condition(@scope, "last_name_kana", words))
                 .or(like_search_condition(@scope, 'CONCAT(users.last_name_kana, users.first_name_kana)', words))
    end

    def search_email
      return if @q.email.blank?

      words = split_freewords(@q.email)

      # eager_loadを行なっているため、2つのテーブルのどちらにも同じカラム名がある場合、テーブル名を指定して検索します
      @scope = like_search_condition(@scope, "users.email", words)
    end
end
