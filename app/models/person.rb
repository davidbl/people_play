class Person < ApplicationRecord
  has_and_belongs_to_many :children, class_name: Person, join_table: 'children_parents', foreign_key: :parent_id, association_foreign_key: :child_id
  has_and_belongs_to_many :parents, class_name: Person, join_table: 'children_parents', foreign_key: :child_id, association_foreign_key: :parent_id
  has_many :grand_children, class_name: Person, through: :children, source: :children
  has_many :grand_parents, class_name: Person, through: :parents, source: :parents
  has_many :siblings, ->(s) { distinct.where.not(id: s.id) }, class_name: Person, through: :parents, source: :children
  has_many :aunts_uncles, ->(s) { distinct.where.not(id: s.parent_ids) }, class_name: Person, through: :parents, source: :siblings
  has_many :cousins, ->(s) { distinct.where.not(id: s.sibling_ids) }, class_name: Person, through: :aunts_uncles, source: :children
end
