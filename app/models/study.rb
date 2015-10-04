class Study < ActiveRecord::Base
  belongs_to :course
  has_many :study_passages
end
