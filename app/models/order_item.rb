# coding: utf-8
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :liquor

  def validate
    errors.add(:amount, "debe ser uno o más") unless amount.nil? || amount > 0
    errors.add(:price, "debe ser un número positivo") unless price.nil? || price > 0.0
  end
end
