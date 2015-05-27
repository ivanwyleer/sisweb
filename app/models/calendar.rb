class Calendar < ActiveRecord::Base

def self.search(search)
  if search
    where('nome LIKE ?', "%#{search}%")
  else
    all
  end
end

belongs_to :service
belongs_to :user
belongs_to :professional

end
