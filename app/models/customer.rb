class Customer < User
has_many :calendar


def self.search(search)
  if search
    where('nome LIKE ? and role_id = ?', "%#{search}%", "1")
  else
    all
  end
end


end