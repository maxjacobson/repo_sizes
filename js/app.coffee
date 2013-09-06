$ ->
  h = 500
  w = 500
  $github_username = $(".github_username")
  $github_username_input = $github_username.find("input")

  $github_username.on "submit", (event) ->
    event.preventDefault()
    username = $github_username_input.val()
    setUsername(username)
    $.ajax
      url: "https://api.github.com/users/#{username}/repos"
      type: 'get'
      dataType: 'jsonp'
      crossDomain: true
      success: (data) ->
        dataset = data.data
        $(".graph_title").text "#{username}'s #{dataset.length} repos sizes"
        $("svg").remove()
        svg = d3.select("body")
              .append("svg")
              .attr("height", h)
              .attr("width", w)
        # end svg =
        tallest = 0
        for d in dataset
          tallest = d.size if d.size > tallest
        # end for
        height_ratio = h / tallest
        svg.selectAll("rect")
           .data(dataset)
           .enter()
           .append("rect")
           .attr("x", (d, i) -> (w / dataset.length) * i)
           .attr("y", (d, i) -> h - d.size * height_ratio)
           .attr("width", (w / dataset.length) - 3)
           .attr("height", (d, i) -> d.size * height_ratio)
           .attr("fill", "teal")
           .on("mouseover", (d) ->
              d3.select(this).style("fill", "black")
              $(".bar_title").text "repo '#{d.name}' has size #{d.size}"
            ).on("mouseout", ->
              d3.select(this).style("fill", "teal")
            )
        # end graph creation
      # end success function
    # end ajax
  # end on submit
  username = getUsername()
  if username
    $github_username_input.val username
    $github_username.submit()
  # end if
