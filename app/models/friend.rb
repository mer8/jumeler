class Friend
		include Mongoid::Document

		field :is_accepted, type: Boolean, default:false

		belongs_to :origin_friend, class_name:"User", inverse_of: :origin_friends
		belongs_to :destination_friend, class_name:"User", inverse_of: :destination_friends

end