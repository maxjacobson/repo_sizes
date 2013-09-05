randomNum = (upper_limit) -> Math.floor (Math.random() * upper_limit) + 1
puts      = (output)      -> console.log output

dataset = []
dataset[n] = randomNum 50 for n in [0..15]
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
    if d > 25 then "red" else "teal"

d3.select("body").append "hr"

d3.select("body")
  .selectAll("div")
  .data(dataset)
  .enter()
  .append("div")
  .attr("class", "bar")
  .style("height", (d) -> "#{(parseInt d) * 5}px")
  .style("background-color", (d) -> if d > 25 then "red" else "teal")

d3.select("body").append "hr"

w = 1000
h = 100

svg = d3.select("body")
        .append("svg")
        .attr("width", w)
        .attr("height", h)

circles = svg.selectAll("circle")
          .data(dataset)
          .enter()
          .append "circle"

circles.attr("cx", (d, i) -> (i * 50) + h/2)
       .attr("cy", h/3)
       .attr("r", (d) -> d / 2)
       .attr("fill", (d) -> if d > 25 then "red" else "teal")

d3.select("body").append "hr"

w = 500
h = 100

svg = d3.select("body")
        .append("svg")
        .attr("width", w)
        .attr("height", h)

svg.selectAll("rect")
   .data(dataset)
   .enter()
   .append("rect")
   .attr("x", (d, i) -> (w / dataset.length) * i)
   .attr("y", (d, i) -> h - d)
   .attr("width", (w / dataset.length) - 3)
   .attr("height", (d, i) -> d)
   .attr("fill", (d, i) -> if d > 25 then "red" else "teal")








