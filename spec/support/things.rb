class CreateThings < ActiveRecord::Migration
  def up
    create_table :things do |t|
      t.column :flavor, :string
      t.column :spin,   :integer
    end
  end
  def down
    drop_table :things
  end
end

RSpec.configure do |config|
  config.around(:each, things: true) do |example|
    CreateThings.migrate(:up)
    begin
      example.run
    ensure
      CreateThings.migrate(:down)
    end
  end
end
