class Professional < ActiveRecord::Base

has_many :calendar


def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
  end
end

end
