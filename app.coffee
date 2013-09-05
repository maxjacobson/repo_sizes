randomNum = (upper_limit) -> Math.floor (Math.random() * upper_limit) + 1
puts      = (output)      -> console.log output

dataset = []
dataset[n] = randomNum 50 for n in [0..20]
window.dataset = dataset
puts dataset

d3.select("body")
  .selectAll("span")
  .data(dataset)
  .enter()
  .append("span")
  .text (data) ->
    num = parseInt data
    if num > 25 
      "#{num} is greater than twenty-five"
    else
      "#{num} is less than or equal to twenty-five"
  .style "color", (d) ->
    if d > 25 then "red" else "black"

d3.select("body").append "hr"

d3.select("body")
  .selectAll("div")
  .data(dataset)
  .enter()
  .append("div")
  .attr("class", "bar")
  .style "height", (d) -> "#{(parseInt d) * 5}px"

d3.select("body").append "hr"

w = 500
h = 50

svg = d3
      .select("body")
      .append("svg")
      .attr("width", w)
      .attr("height", h)

circles = svg
          .selectAll("circle")
          .data(dataset)
          .enter()
          .append "circle"

circles.attr("cx", (d, i) -> (i * 50) + 25)
       .attr("cy", h/2)
       .attr("r", (d) -> d)



