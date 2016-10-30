class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  # def self.upcoming
  #   []
  # end

  def self.upcoming
    Event.where("ends_at > ?", Time.now)
  end

  def self.start_before_other_events(time)
    Event.where("starts_at < ?", time)
  end

end
