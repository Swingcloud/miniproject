class Music < ApplicationRecord
	validates_presence_of :name, :compositor, :symphony
end
