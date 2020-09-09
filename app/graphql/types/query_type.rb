module Types
  class QueryType < Types::BaseObject
    # /users
    field :products, [Types::ProductType], null: false

    def products
      Product.all.preload(:category)
    end

    # /product/:id
    field :product, Types::ProductType, null: false do
      description 'Find a product by id'
      argument :id, ID, required: true
    end

    def product(id:)
      Product.find(id)
    end
  end
end
