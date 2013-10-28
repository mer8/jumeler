class Event
	include Mongoid::Document

field :date, type:String
field :time, type:String
field :name, type:String

# has_and_belongs_to_many :eusers, class_name:"Event" inverse_of: :uevents
# embeds_many :point


end