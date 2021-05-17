class AddExampleTypeIdToExample < ActiveRecord::Migration[6.0]
  def change
    add_column :examples, :example_type_id, :int
  end
end
