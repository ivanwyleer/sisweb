class Service < ActiveRecord::Base
has_many :calendar



def self.search(search)
  if search
    where('description LIKE ?', "%#{search}%")
  else
    all
  end
end


end
