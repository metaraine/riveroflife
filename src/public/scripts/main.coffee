birthYear = 1985
data = [
	{
		title: 'Birth'
		age: 0
		value: 100
	}
	{
		title: 'Scolded for kicking classmate on swing'
		age: 9
		value: 20
		description: 'Something'
	}
	{
		age: 10
		value: 25
	}
	{
		age: 18
		value: 80
	}
	{
		age: 19
		value: 20
	}
	{
		age: 29
		value: 80
	}
	{
		title: 'Death'
		age: 90
		value: 100
	}
]

# Adds two numbers together
addTwo = (x,y)-> x + y

# Adds the given arguments together
add = ()->
	[].reduce.call arguments,addTwo

# Converts the given to a string by calling its toString method
intoString = (value)-> value.toString()

# Creates a clone of the given object with the given key set to a new value
setValue = (o, key, value)->
	newObject = _.clone o
	newObject[key] = value
	newObject

# Creates a mapping function that applies the given function to the value of the specific key when mapping over objects
mapOverKey = (f, originalKey, newKey)->
	(o)->
		setValue(o, newKey or originalKey, f(o[originalKey]))

# Invokes a function on an object and returns the object (for chaining purposes)
tap = (f, o)->
	f(o)
	o

# console.log's the given object and returns the object (for chaining purposes)
spy = _.partial tap, console.log.bind(console)

templateHoverLabel = Handlebars.compile $('#hover-label').html()

new Morris.Line
	element: 'chart'
	data: data
	.map mapOverKey _.partial(add, birthYear), 'age', 'year'
	.map mapOverKey intoString, 'year'
	xkey: 'year'
	ykeys: ['value']
	labels: ['Unselfconsciousness']
	smooth: false
	postUnits: '%'
	resize: true
	xLabelFormat: (date)->
		date.getFullYear() - birthYear
	hoverCallback: (index, options, content, row)->
		templateHoverLabel row
