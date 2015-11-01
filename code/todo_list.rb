class TodoItem
	attr_accessor :description

	def initialize(description, done=false)
		@description = description
		@done = done
	end

	def done?
		@done
	end

	def done!
		@done = true
	end

end

class TodoList
	attr_reader :name, :color, :items

	def initialize(name, color={})
		@name = name
		@color = color[:color]
		@items = []
	end

	def add(item)
		if item.class == TodoItem
			@items.push(item)
		else
			@items.push(TodoItem.new(item))
		end
	end

	def items_pending
		@items_pending = []	
		@items.each do |x|
			if !x.done?
				@items_pending.push(x)
			end
		end
		@items_pending
	end

	def items_done
		@items_done = []
		@items.each do |x|
			if x.done?
				@items_done.push(x)
			end
		end
		@items_done
	end

	def find_by_description(description)
		@items.each do |x|
			if x.description == description
				x
			end
		end		
	end

	def set_as_done(description)
		@items.each do |x|
			if x.description == description
				x.done!
			end
		end
	end

end