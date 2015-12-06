class AddCompanyToMoot < ActiveRecord::Migration
  def change
    add_reference :moots, :company, index: true, foreign_key: true
  end
end
