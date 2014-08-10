require "spec_helper"
require "stringio"

class CarvingTest
  include Carving
  tag_logger :alpha
end

describe Carving do
  let(:buffer) { StringIO.new("") }
  let(:logger) { ::Logger.new(buffer).tap { |my| my.formatter = ->(_,_,_,message) { [message, "\n"].join } } }

  it "can tag a log with standalone tags" do
    CarvingTest.logger :alpha
    CarvingTest.new.logger info "Hello, world"
    expect(buffer.string).to eq "Hello, world #alpha\n"
  end

  it "can tag a log with named tags and procs" do
    CarvingTest.logger :alpha, beta: "123", gamma: ->() { 456 }
    CarvingTest.new.logger info "Hello, world"
    expect(buffer.string).to eq "Hello, world #alpha #beta:123 #gamma:456\n"
  end

end
