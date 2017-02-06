# frozen_string_literal: true
class Example < ApplicationRecord
  belongs_to :user
  validates :text, :user, presence: true
end
