class AddPlanToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :plan, index: true, foreign_key: true
  end
end
