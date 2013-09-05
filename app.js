// Generated by CoffeeScript 1.6.3
(function() {
  var dataset, n, randomNum, _i;

  randomNum = function(upper_limit) {
    return Math.floor((Math.random() * upper_limit) + 1);
  };

  dataset = [];

  for (n = _i = 0; _i <= 20; n = ++_i) {
    dataset[n] = randomNum(50);
  }

  d3.select("body").selectAll("span").data(dataset).enter().append("span").text(function(data) {
    var num;
    num = parseInt(data);
    if (num > 25) {
      return "" + num + " is greater than twenty-five";
    } else {
      return "" + num + " is less than or equal to twenty-five";
    }
  }).style("color", function(d) {
    if (d > 25) {
      return "red";
    } else {
      return "black";
    }
  });

  d3.select("body").append("hr");

  d3.select("body").selectAll("div").data(dataset).enter().append("div").attr("class", "bar").style("height", function(d) {
    return "" + ((parseInt(d)) * 5) + "px";
  });

}).call(this);
