class Study < ActiveRecord::Base
  belongs_to :course
  has_many :study_passages
  belongs_to :bible_book

  def to_h
    {
      name: name,
      description: description,
      course: course.to_h,
      study_passages: study_passages.collect(&:to_h)
    }
  end
end
