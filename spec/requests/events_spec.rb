require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "should accepts saerch on the homepage" do
      # get events_index_path
      # expect(response).to have_http_status(200)
      m = Event.create!(name: "Dam Vinh Hung's concert", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
                        venue: Venue.new, category: Category.new)
      n = Event.create!(name: "Scorpion in Vietnam", starts_at: 2.days.ago, ends_at: 3.day.from_now, extended_html_description: " a future event",
                        venue: Venue.new, category: Category.new)
      get root_path(search: "Scorpion")
      expect(response).to have_http_status(200)
      expect(response.body).to include "Scorpion in Vietnam"
      expect(response.body).to include "concert"
    end

    end

  describe "GET /new_event_ticket" do

    it "should accepts saerch on the homepage" do
      # get root_path(search: "Scorpion")

      n = Event.create!(id: 3,name: "Scorpion in Vietnam", starts_at: 2.days.ago, ends_at: 3.day.from_now, extended_html_description: " a future event",
                        venue: Venue.new, category: Category.new)
      # m = TicketType.create!(event_id:1, name: "Scorpion in Vietnam")
      # get "/new_event_ticket?event_id=1"
      get new_event_ticket_path(event_id: "3")
      expect(response).to have_http_status(200)
      # expect(response.body).to include "Scorpion in Vietnam"
      # expect(response.body).to include "concert"
    end

  end
end
