class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :store_name, :string
  attribute :department, :string
  attribute :statuses, array: :string, default: []
  attribute :roles, array: :string, default: []
  attribute :name, :string
  attribute :name_kana, :string
  attribute :email, :string
end
