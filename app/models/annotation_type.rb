class AnnotationType < ActiveRecord::Base

  TYPES=['Question','Commentary','Other']
  
  def to_h
    {
      description: description
    }
  end
end
