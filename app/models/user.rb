class User < ApplicationRecord
    has_many :courseenrollments
    has_many :primary_testresults, class_name: "Testresults", foreign_key: "grader"
    has_many :secondary_tickets, class_name: "Testresults", foreign_key: "student"
end
