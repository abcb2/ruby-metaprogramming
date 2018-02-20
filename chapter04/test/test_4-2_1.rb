require "minitest/autorun"
require "pp"

module Kernel
  def with(resource, &block)
    begin
      yield if block_given?
    ensure
      resource.dispose
    end
  end
end

class TestSample < Minitest::Test
  class Resource
    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def setup
  end

  def test_01
    r = Resource.new
    assert_raises Exception do
      with(r) {
        raise Exception
      }
    end
    assert r.disposed?
  end

  def test_02
    r = Resource.new
    with(r)
    assert r.disposed?
  end

end

