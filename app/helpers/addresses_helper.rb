module AddressesHelper
  def address_polymorphic_path(addressable)
    if addressable.class.class_name == "User"
      return user_address_path(addressable)
    elsif addressable.class.class_name == "Account"
      return account_address_path(addressable)
    end
  end
end
