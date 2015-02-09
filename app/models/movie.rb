class Movie < ActiveRecord::Base
	belongs_to :user
 	acts_as_votable
 	
 	has_attached_file :avatar,
 	:path => ":class/:id/:filename",
    :url => ":class/:id/:filename"


	validates_attachment_content_type :avatar, 
	:content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
	:storage => :s3,
    :bucket => 'mytitanium'


end