birthYear = 1985
deathAge = 90
currentYear = (new Date).getFullYear()
currentAge = currentYear - birthYear

data = [
	{
		title: 'Birth'
		age: 0
		value: 100
	}
	{
		title: 'Started talking'
		age: 2
		value: 99
	}
	{
		title: 'Moved to Vermont'
		age: 4
		value: 99
	}
	{
		title: 'Started kindergarten'
		age: 5
		value: 90
	}
	{
		title: 'Scolded for kicking classmate on swing'
		age: 9
		value: 20
		description: 'Something'
	}
	{
		title: 'Older students complimented my saxaphone playing'
		age: 10
		value: 25
	}
	{
		title: 'Danced the Grapevine'
		age: 11
		value: 22
	}
	{
		title: 'Was told my eyebrows looked funny'
		age: 14
		value: 30
	}
	{
		title: 'Sang and played guitar in front of my high school'
		age: 18
		value: 80
	}
	{
		title: 'College orientation'
		age: 19
		value: 20
	}
	{
		title: 'Discovered love of teaching'
		age: 26
		value: 75
	}
	{
		title: 'Celebrated coffee house at end of Maitri I'
		age: 29
		value: 80
	}
	{
		title: 'Interned at Mental Health Partners'
		age: 31
		value: 45
	}
	{
		title: 'Traveled through India and Southeast Asia'
		age: 39
		value: 66
	}
	{
		title: 'Met lifelong partner'
		age: 42
		value: 90
	}
	{
		title: '3-year Retreat'
		age: 45
		value: 97
	}
	{
		title: 'Facilitated first workshop at the Contemplative Life Institute'
		age: 48
		value: 85
	}
	{
		title: 'Became Director of the Contemplative Life Institute'
		age: 50
		value: 81
	}
	{
		title: 'Launched the Contemplative Life Institute\'s first Summer of Self-Discovery'
		age: 54
		value: 93
	}
	{
		title: 'Meltdown at international peacekeeping conference'
		age: 56
		value: 48
	}
	{
		title: 'Discriminated against because of my age'
		age: 62
		value: 60
	}
	{
		title: 'First published book receives harsh criticism'
		age: 65
		value: 65
	}
	{
		title: 'Self-identity challenged with first major physical disability'
		age: 70
		value: 87
	}
	{
		title: 'Celebrated 40-year anniversary with partner'
		age: 82
		value: 90
	}
	{
		title: 'Stroke eliminated higher cognitive functioning'
		age: 88
		value: 99
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

# initialize chart
new Morris.Line
	element: 'chart'
	data: data
		.map mapOverKey _.partial(add, birthYear), 'age', 'year'
		.map mapOverKey intoString, 'year'
	events: [currentYear.toString()]
	eventLineColors: ['lightgray']
	xkey: 'year'
	ykeys: ['value']
	labels: ['Unselfconsciousness']
	lineColors: ['#2ecc71']
	smooth: false
	postUnits: '%'
	resize: true
	hideHover: true
	xLabelFormat: (date)->
		date.getFullYear() - birthYear
	hoverCallback: (index, options, content, row)->
		templateHoverLabel row

# set x-position of .present dynamically based on current year
$('.present').css 'left', (currentAge/deathAge*100 + 1) + '%'
