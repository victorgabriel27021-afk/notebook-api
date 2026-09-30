class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  def author
    "Victor"
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h
  end
end