class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :title, :string
  attribute :body, :string
end
