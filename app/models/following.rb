class Following < ActiveRecord::Base
  validates_presence_of :name
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  belongs_to :domain
end
