json.array! @shops, partial: "shops/shop", as: :shop

json.id     @shop.id
json.name   @shop.name