class Thing < ActiveRecord::Base
  # flavor
  # spin
end

describe "when used with Rails", :things do
  it "has a Thing" do
    expect(Thing.count).to eq 0
  end
end
