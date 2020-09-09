class Mutations::CreateProduct < Mutations::BaseMutation
  argument :title, String, required: true
  argument :category_id, Int, required: true

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(title:, category_id:)
    product = Product.new(title: title, category_id: category_id)
    if product.save
      {
          product: product,
          errors: []
      }
    else
      {
          product: nil,
          errors: product.errors.full_messages
      }
    end
  end
end