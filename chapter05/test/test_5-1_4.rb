require "minitest/autorun"
require "awesome_print"

class Loan
  def initialize(book)
    @book = book
    @time = Time.now
  end
end

class Loan2
  def initialize(book)
    @book = book
    @time_class = Loan2.time_class.now
  end

  def self.time_class
    @time_class || Time
  end

  def to_s
    "#{self.class} #{@book} #{@time_class}"
  end
end

class FakeTime
  def self.now
    "Mon Apr 06 12:15:50"
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    Loan2.instance_eval { @time_class = FakeTime }
    loan = Loan2.new("hogehoge")
    assert_equal("Loan2 hogehoge Mon Apr 06 12:15:50", loan.to_s)
  end

end
