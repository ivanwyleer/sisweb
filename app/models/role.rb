class Role < ActiveRecord::Base
def change
t.string :name

has_many :user

end
end
