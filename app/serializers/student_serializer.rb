class StudentSerializer < ActiveModel::Serializer
  attributes :name, :age, :major, :id

  belongs_to :instructor
end
