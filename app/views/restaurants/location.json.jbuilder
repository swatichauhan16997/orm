json.addresses do
  json.array!(@addresses) do |address|
    json.name address.area + ',' + address.city
    json.url area_path(area: address.area)
  end
end
