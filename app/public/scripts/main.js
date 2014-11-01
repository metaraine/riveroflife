(function() {
  var add, birthYear, data, intoString, mapOverKey, setValue, spy, tap, templateHoverLabel;

  birthYear = 1985;

  data = [
    {
      title: 'Birth',
      age: 0,
      value: 100
    }, {
      title: 'Scolded for kicking classmate on swing',
      age: 9,
      value: 20,
      description: 'Something'
    }, {
      age: 10,
      value: 25
    }, {
      age: 18,
      value: 80
    }, {
      age: 19,
      value: 20
    }, {
      age: 29,
      value: 80
    }, {
      title: 'Death',
      age: 90,
      value: 100
    }
  ];

  add = function(x, y) {
    return x + y;
  };

  intoString = function(value) {
    return value.toString();
  };

  setValue = function(o, key, value) {
    var newObject;
    newObject = _.clone(o);
    newObject[key] = value;
    return newObject;
  };

  mapOverKey = function(f, originalKey, newKey) {
    return function(o) {
      return setValue(o, newKey || originalKey, f(o[originalKey]));
    };
  };

  tap = function(f, o) {
    f(o);
    return o;
  };

  spy = _.partial(tap, console.log.bind(console));

  templateHoverLabel = Handlebars.compile($('#hover-label').html());

  new Morris.Line({
    element: 'chart',
    data: data.map(mapOverKey(_.partial(add, birthYear), 'age', 'year')).map(mapOverKey(intoString, 'year')),
    xkey: 'year',
    ykeys: ['value'],
    labels: ['Unselfconsciousness'],
    smooth: false,
    postUnits: '%',
    resize: true,
    xLabelFormat: function(date) {
      return date.getFullYear() - birthYear;
    },
    hoverCallback: function(index, options, content, row) {
      return templateHoverLabel(row);
    }
  });

}).call(this);
