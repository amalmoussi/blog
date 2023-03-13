class CreateMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :measures do |t|
      t.float :temperature
      t.float :humidity

      t.timestamps
    end
  end
end
