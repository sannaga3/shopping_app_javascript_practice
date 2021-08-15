json.extract! @item, :id, :name, :price, :stock, :comment, :shop_id, :created_at, :updated_at
json.url item_url(@item, format: :json)
