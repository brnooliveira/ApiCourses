class Testresult < ApplicationRecord
  belongs_to :test
  belongs_to :grader, class_name: "User"
  belongs_to :student, class_name: "User"
end
