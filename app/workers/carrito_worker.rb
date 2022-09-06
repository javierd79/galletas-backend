class CarritoWorker 
  include Sidekiq::Worker
  sidekiq_options retry: false

  def createCarrito(user_id)
    user = User.find(user_id)
    carrito = Carrito.create(user_id: user_id)
    user.carrito = carrito
    user.save
  end
  
  # make a function to add a product to the carrito and validate if the product is already in the carrito and if exists in the database do quantity - product
  def addProductToCarrito(product_id, carrito_id)
    product = Product.find(product_id)
    carrito = Carrito.find(carrito_id)
    product_carrito = ProductsCarrito.create(product_id: product_id, carrito_id: carrito_id)
    carrito.products << product
    carrito.save
  end

  def buyProducts(carrito_id)
    carrito = Carrito.find(carrito_id)
    carrito.products.each do |product|
      available_product = AvailableProduct.find_by(name: product.name)
      available_product.quantity -= 1
      available_product.save
    end
    carrito.products.destroy_all
  end
  
end