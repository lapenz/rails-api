module Types
  class MutationType < Types::BaseObject

    field :create_product, mutation: Mutations::CreateProduct,
      description: "Create new product"

  end
end
