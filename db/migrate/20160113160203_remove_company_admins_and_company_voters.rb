class RemoveCompanyAdminsAndCompanyVoters < ActiveRecord::Migration
  def change
    drop_table :company_admins
    drop_table :company_voters
  end
end
