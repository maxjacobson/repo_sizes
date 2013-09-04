dataset = [5, 10, 15, 20, 25]

d3.select("body")
  .selectAll("p")
  .data(dataset)
  .enter()
  .append("p")
  .text (data) ->
    num = parseInt data
    if num > 10
      "#{num} is greater than ten"
    else
      "#{num} is less than or equal to ten"
  .style "color", (d) ->
    if d > 15 then "red" else "black"

