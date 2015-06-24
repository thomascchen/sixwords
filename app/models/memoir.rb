class Memoir < ActiveRecord::Base
  belongs_to :neighborhood

  validates :name, presence: true
  validates :age, presence: true
  validates :memoir, presence: true
  validates :neighborhood_id, presence: true

end
