require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#upcoming" do
    it "should return [] when there are no events" do
      expect(Event.upcoming).to eq []
    end

    it "should return [] when there are only past events" do
      Event.create!(starts_at: 2.day.ago, ends_at: 1.day.ago,
                    extended_html_description: "a past event",
                    venue: Venue.new, category: Category.new)
      expect(Event.upcoming).to eq []
    end

    it "should return [n] when there are a past event 'm' and a future even 'n' " do
      m = Event.create!(name: "a", starts_at: 2.days.ago, ends_at: 1.day.ago,
                        extended_html_description: "a past event",
                        venue: Venue.new, category: Category.new)
      n = Event.create!(name: "b", starts_at: 2.days.ago, ends_at: 1.day.from_now,
                        extended_html_description: "a future event",
                        venue: Venue.new, category: Category.new
      )
      expect(Event.upcoming).to eq [n]
    end


  end

  let(:this_event) { Event.create!(name: "current", starts_at: 2.day.ago, ends_at: 3.day.from_now,
                                   extended_html_description: "current event0",
                                   venue: Venue.new, category: Category.new)
  }

  let(:old_event) { Event.create!(name: "old", starts_at: 3.day.ago, ends_at: 4.day.from_now,
                                  extended_html_description: "old event",
                                  venue: Venue.new, category: Category.new)
  }
  let(:very_old_event) { Event.create!(name: "very_old", starts_at: 3.day.ago, ends_at: 4.day.from_now,
                                       extended_html_description: "very old event",
                                       venue: Venue.new, category: Category.new)
  }

  describe "#start_before_other_events" do
    it "should return no event start before this event" do
      expect(Event.start_before_other_events(this_event.starts_at)).to eq []
    end
  end

  describe "#start_before_other_events" do
    it "should return old  event start before this event" do
      old_event
      expect(Event.start_before_other_events(this_event.starts_at)).to eq [old_event]
    end
  end


end
