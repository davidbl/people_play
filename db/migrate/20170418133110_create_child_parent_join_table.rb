class CreateChildParentJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table 'children_parents', id: false do |t|
      t.belongs_to :child, index: true
      t.belongs_to :parent, index: true
    end
  end
end
