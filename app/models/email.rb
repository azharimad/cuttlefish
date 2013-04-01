class Email < ActiveRecord::Base
  belongs_to :from_address, :class_name => "EmailAddress"

  def from
    from_address.address
  end

  def to
    read_attribute(:to).split(", ")
  end

  # Doing this in the dumbest way to start with
  def to_addresses
    to.map{|t| EmailAddress.find_by_address(t)}
  end
end