module SearchableByName
    extend ActiveSupport::Concern
  
    included do
      scope :search, -> (term) { where("name ILIKE ?", "%#{term}%") }
    end
  
    def as_json(options={})
      {
        id:           id,
        name:         name,
        location:     "/#{self.class.name.pluralize.downcase}/#{id}",
        type:         self.class.name
      }
    end
  end
