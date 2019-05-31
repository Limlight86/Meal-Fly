module SearchableByName
    extend ActiveSupport::Concern
  
    included do
      scope :search, -> (term) { where("name LIKE ?", "%#{term}%") }
    end
  
    def as_json(options={})
      {
        id: id,
        name: name,
        location: "/#{self.class.name.pluralize.downcase}/#{id}"
      }
    end
  end