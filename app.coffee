randomNum = (upper_limit) -> Math.floor (Math.random() * upper_limit) + 1
puts      = (output)      -> console.log output

$ ->
  h = 500
  w = 500
  svg = d3.select("body")
          .append("svg")
          .attr("height", h)
          .attr("width", w)
          .attr("fill", "red")
  $github_username = $(".github_username")
  $github_username_input = $github_username.find("input")
  dataset = []
  $github_username.on "submit", (event) ->
    event.preventDefault()
    username = $github_username_input.val()
    $github_username_input.val ""
    url = "https://api.github.com/users/#{username}/repos"
    $.ajax
      url: url
      type: 'get'
      dataType: 'jsonp'
      crossDomain: true
      success: (data) ->
        dataset = data.data
        puts dataset
        svg.selectAll("rect")
           .data(dataset)
           .enter()
           .append("rect")
           .attr("x", (d, i) -> (w / dataset.length) * i)
           .attr("y", (d, i) -> h - d.size)
           .attr("width", (w / dataset.length) - 3)
           .attr("height", (d, i) -> d.size)
           .attr("fill", "teal")
