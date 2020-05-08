class Club < ActiveRecord::Base
  def self.all_categories
    {
      'Academic'  => ['Art', 'CS & Engineering', 'Economics & Business', 'English', 'Foreign Language', 'Math', 'Science', 'Social Sciences'],
      'Activism' => ['Community Service & Philanthropy', 'Leadership', 'Politics'],
      'Cultural' => ['Asian', 'African American', 'Latinx', 'Middle Eastern', 'Religion'],
      'Recreational'  => ['Outdoors', 'Sports', 'Video Games']
    }
  end
  
  def self.sort_criteria
    ['Name', 'Category', 'Subcategory']
  end
  
  def self.not_found?(search)
    Club.where(name: search).empty?
  end
  
  def self.search_by(search)
    Club.where(name: search)
  end
  
  def self.with_categories(subcategories, sort)
    Club.where(subcategory: subcategories).order(sort) 
  end
  
  has_many :events
end

class Event < ActiveRecord::Base
  belongs_to :club
end
