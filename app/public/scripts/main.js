(function() {
  new Morris.Line({
    element: 'chart',
    data: [
      {
        age: '0',
        value: 100
      }, {
        age: '9',
        value: 20
      }, {
        age: '10',
        value: 25
      }
    ],
    xkey: 'age',
    ykeys: ['value'],
    labels: ['Unselfconsciousness']
  });

}).call(this);
