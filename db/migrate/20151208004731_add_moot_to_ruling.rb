class AddMootToRuling < ActiveRecord::Migration
  def change
    add_reference :rullings, :moot, index: true, foreign_key: true
  end
end
