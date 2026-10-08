class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  belongs_to :kind do 
    link(:related) {contact_address_url(object.contact.id)}
  end
end