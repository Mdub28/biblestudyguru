class Course < ActiveRecord::Base
  belongs_to :user
  has_many :studies

  def as_json(options={})
    super(include: [:studies])
  end
end
