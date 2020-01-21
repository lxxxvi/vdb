class ReleaseDecorator < SimpleDelegator
  def display_facts(delimited_by = ' | ')
    gather_facts.map(&:last)
                .find_all(&:present?)
                .join(delimited_by)
  end

  private

  def gather_facts
    [
      ['Label', object.label],
      ['Catalog #', object.catalog_number],
      ['Year', object.year],
      ['Genre', object.genre],
      ['Format quantity', object.format_quantity],
      ['Format', object.format]
    ]
  end

  def object
    @object ||= __getobj__
  end
end
