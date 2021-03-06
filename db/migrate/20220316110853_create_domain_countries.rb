class CreateDomainCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :domain_countries do |t|
      t.string :domain
      t.string :country
      t.float :percentage

      t.timestamps
    end

    add_index(:domain_countries, [:domain, :country], unique: true)
  end
end
