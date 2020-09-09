module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :category, Types::CategoryType, null: true
    field :category_id, Int, null: true
  end
end
