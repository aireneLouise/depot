require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do  
    mail = Notifier.order_received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end


  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    # Note: This is for you @airene
    # Explanation:
    #   This test is a bit brittle. But for the sake of learning this will do.
    #   This part matches the string => orders(:one).line_items.first.product.title
    #         assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
    #   The matching might be an since book is based on the older version of Ruby. There
    #   will lots more like this on book. Please proceed through.
    #   Note: Also please make your commit more descriptive. Like this current commit.
    #   Thanks.
  
    puts "----------------- inspect orders ---------------"
    puts orders(:one).inspect
    puts orders(:one).line_items.inspect
    puts orders(:one).line_items.first.product.title
    puts "-------------------------------------------------"
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded  
  end

end
