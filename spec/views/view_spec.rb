require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  it "displays the event location" do
    assign(:event, Event.new(name: "halloween", starts_at: 2.days.ago, ends_at: 3.day.from_now, extended_html_description: " a future event",
                             venue: Venue.new, category: Category.new))
    render
    expect(rendered).to include("halloween")
  end
end