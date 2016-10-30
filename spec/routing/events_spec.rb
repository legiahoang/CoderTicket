require 'rails_helper'

RSpec.describe "routing to upcoming", :type => :routing do
  it "routes /upcoming to events#index" do
    expect(:get => "/upcoming").to route_to(
                                      :controller => "events",
                                      :action => "index"
                                  )
  end

end

RSpec.describe "routing to new ticket", :type => :routing do
  it "routes /new_event_ticket to tickets#new" do
    expect(:get => "/new_event_ticket").to route_to(
                                      :controller => "tickets",
                                      :action => "new"
                                  )
  end

end