// Generated by CoffeeScript 1.6.3
(function() {
  var puts, randomNum;

  randomNum = function(upper_limit) {
    return Math.floor((Math.random() * upper_limit) + 1);
  };

  puts = function(output) {
    return console.log(output);
  };

  $(function() {
    var $github_username, $github_username_input, h, w;
    h = 500;
    w = 500;
    $github_username = $(".github_username");
    $github_username_input = $github_username.find("input");
    return $github_username.on("submit", function(event) {
      var username;
      event.preventDefault();
      username = $github_username_input.val();
      $github_username_input.val("");
      return $.ajax({
        url: "https://api.github.com/users/" + username + "/repos",
        type: 'get',
        dataType: 'jsonp',
        crossDomain: true,
        success: function(data) {
          var d, dataset, height_ratio, svg, tallest, _i, _len;
          dataset = data.data;
          window.dataset = dataset;
          puts(dataset);
          $(".graph_title").text("" + username + "'s " + dataset.length + " repos sizes");
          $("svg").remove();
          svg = d3.select("body").append("svg").attr("height", h).attr("width", w);
          tallest = 0;
          for (_i = 0, _len = dataset.length; _i < _len; _i++) {
            d = dataset[_i];
            if (d.size > tallest) {
              tallest = d.size;
            }
          }
          window.tallest = tallest;
          height_ratio = h / tallest;
          return svg.selectAll("rect").data(dataset).enter().append("rect").attr("x", function(d, i) {
            return (w / dataset.length) * i;
          }).attr("y", function(d, i) {
            return h - d.size * height_ratio;
          }).attr("width", (w / dataset.length) - 3).attr("height", function(d, i) {
            return d.size * height_ratio;
          }).attr("fill", "teal");
        }
      });
    });
  });

}).call(this);
