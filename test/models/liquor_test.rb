require 'test_helper'

class LiquorTest < ActiveSupport::TestCase
   fixtures :suppliers, :producers, :liquors, :liquors_suppliers

  test "failing_create" do
    liquor = Liquor.new
    assert_equal false, liquor.save
    assert_equal 7, liquor.errors.count
    assert liquor.errors[:name]
    assert liquor.errors[:producer]
    assert liquor.errors[:suppliers]
    assert liquor.errors[:produced_at]
    assert liquor.errors[:blurb]
    assert liquor.errors[:graduation]
    assert liquor.errors[:price]
  end

  test "create" do
    liquor = Liquor.new(
      :name => 'Ruby on Rails',
      :suppliers => Supplier.all,
      :producer_id => Producer.find(1).id,
      :produced_at => Time.now,
      :blurb => 'A great book',
      :graduation => 375,
      :price => 45.5
    )
  assert liquor.save
  end

  test "has_many_and_belongs_to_mapping" do
    apress = Producer.find_by_name("Apress");
    count = apress.liquors.count
    liquor = Liquor.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                     Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :produced_at => Time.now,
      :blurb => 'E-Commerce on Rails',
      :graduation => 400,
      :price => 55.5
    )
    apress.liquors << liquor
    apress.reload
    liquor.reload
    assert_equal count + 1, apress.liquors.count
    assert_equal 'Apress', liquor.producer.name
  end

  test "has_many_and_belongs_to_many_suppliers_mapping" do
    liquor = Liquor.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                     Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :producer_id => Producer.find_by_name("Apress").id,
      :produced_at => Time.now,
      :blurb => 'E-Commerce on Rails',
      :graduation => 400,
      :price => 55.5
    )
    assert liquor.save
    liquor.reload
    assert_equal 2, liquor.suppliers.count
    assert_equal 2, Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky').liquors.count
  end
end
