require 'swagger_helper'

describe 'Products API' do

  path '/products' do

    post 'Creates a product' do
      tags 'Products'
      consumes 'application/json', 'application/xml'
      parameter name: :product, in: :body, schema: {
          type: :object,
          properties: {
              title: { type: :string },
              category_id: { type: :integer }
          },
          required: [ 'title', 'category_id' ]
      }

      response '201', 'product created' do
        let(:pet) { { title: 'Dodo', category_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:product) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/products/{id}' do

    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'product found' do
        schema type: :object,
               properties: {
                   id: { type: :integer, },
                   title: { type: :string },
                   category: { type: :object }
               },
               required: [ 'id', 'title', 'category' ]

        let(:id) { Product.create(title: 'foo', category_id: 1).id }
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end