class TodoItem
	#attr_accessor :done
	attr_accessor :description
	def initialize(description,done=false)
		@description = description
		@done = done
	end
	def done?
		!!@done
	end
	def done
		@done = true
	end
end


class TodoList
	attr_accessor :name
	attr_accessor :items
	def initialize(name, color = {:color => :red})
		@color = color
		@name = name
		@items = Array.new
	end
	def add(item)
		if item.instance_of? String
			@items.push(TodoItem.new(item))
		else 
			@items.push(item)
		end
	end
	def items_pending
		@items.find_all{|x| x.done? == false}
	end
	def items_done
		@items.find_all{|x| x.done? == true}
	end
	def color
		@color[:color]
	end
	def find_by_description(description)
		@items.find{|x| x.description == description}
	end
	def done_by_description
		@items_done.find{|x| x.description == description}
	end
	def set_as_done(description)
		self.find_by_description(description).done
	end
end
