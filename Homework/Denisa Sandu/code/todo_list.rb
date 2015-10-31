class TodoItem
	attr_accessor :done
	attr_accessor :description
	def initialize(description, done = false)
		@description = description
		@done = done
	end
	def done!
		@done = true
	end
	def done?
		return @done
	end
end

class TodoList
	attr_accessor :name, :color,:items, :items_pending, :items_done
	def initialize(name, color = {:color => :none})
		@name = name
		@color = color[:color]
		@items = []
		@items_pending = []
		@items_done = []
	end
	def add(item)
		if item.to_s == item
			auxItem = TodoItem.new(item)
			@items.push(auxItem)
			@items_pending.push(auxItem)
		elsif item.done?
			@items.push(item)
			@items_done.push(item)
		else 
			@items.push(item)
			@items_pending.push(item)
		end
	end
	def find_by_description(description)
		return @items.each{|x| x.description == description}[0]
	end
	def set_as_done(description)
		if (find_by_description(description))
			find_by_description(description).done!
			return true
		else 
			return false
		end
	end
end