class Event < ActiveRecord::Base

	scope :sorted, lambda { order("events.title ASC") }
end
