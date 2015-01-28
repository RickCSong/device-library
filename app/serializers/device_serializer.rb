class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :hardware, :operating_system, :storage_code, :barcode, :status, :details

  has_one :user
  has_one :category
end
