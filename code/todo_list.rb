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
	attr_reader :items, :color, :name
	def initialize(name, opts = {})
		@name = name
		@color = opts[:color]
		@items = []
	end
	def add(item)
		if item.is_a? String
			@items << TodoItem.new(item)
		else
			@items << item
		end
	end

	def items_pending
		items.select {|e| not e.done?}
	end
	def items_done
		items.select {|e| e.done?}
	end
	def find_by_description(description)
		items.find {|e| e.description == description}
	end
	def set_as_done(description)
		item = self.find_by_description(description)
		if item
			item.done!
		else
			false
		end
	end

end