class Item < Node
  validate :parent, :parent_must_be_section
  validates_presence_of :min_hours, :max_hours

  belongs_to :item_template

  def parent_must_be_section
    if parent.type != 'Section'
      errors.add :parent, 'must be a section'
    end
  end
end
