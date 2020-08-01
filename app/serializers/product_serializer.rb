class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :category

end
