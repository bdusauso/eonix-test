class Person < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true

  scope :by_name, ->(name) { where("firstname like ?", "%#{name}%").or(where("lastname like ?", "%#{name}%")) }

  def as_json(options = {})
    super(only: [:id, :firstname, :lastname])
  end
end
