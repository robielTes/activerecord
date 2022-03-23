class CreateIndividuals < ActiveRecord::Migration[6.0]
  def change
    create_table :individuals do |t|
      t.integer :client_id
    end
  end
end
