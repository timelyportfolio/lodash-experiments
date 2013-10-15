# explore making rCharts.js to move some of rCharts functionality to js

simpleData = data.frame(col1 = 1:3,col2 =LETTERS[1:3])
# for rCharts libraries, 3 categories for data
#1. Object of column objects   "columns"
rCharts::to_json(simpleData, "columns")
#2. Array of row objects       "records"
rCharts::to_json(simpleData, "records")
#3. Array of row arrays        "values"
rCharts::to_json(simpleData, "values")

libraryData = data.frame(rbind(
  c("dataTables","values","$('#' + chartParams.dom).dataTable(
      chartParams.table
    )"),
  c("dimple","records","var myChart = new dimple.chart(svg, data);"),
  c("highcharts","values",'"name": "None",
"type": "scatter",
"marker": {
 "radius":      3 
} 
},
{
 "data": [
 [
    152,
90 
],
['),
  c("micropolar","values","micropolar.factory[chartParamschart247865c43e28.type](
    chartParamschart247865c43e28
  )"),
  c("morris","records","new Morris[chartType](chartParams) with data as chartParams.data"),
  c("nvd3","records",'d3.select("#" + opts.id)
    .append("svg")
    .datum(data) d3.nest translate for most types"'),
  c("polycharts","columns"," _.each(chartParams.layers, function(el){
        el.data = polyjs.data(el.data)
    })"),
  c("rickshaw","blend series:[
                        {data:[{x:,y:},{x:,y:}], name: 'seriesname',info:{}}]",
    "var graphchart1b4868d955e9 = new Rickshaw.Graph(chartParams);"),
  c("uvCharts","nested records","var chartchart1b486c9c54f6 = uv.chart(chartParamschart1b486c9c54f6.type, 
    graphdefchart1b486c9c54f6,
    configchart1b486c9c54f6
  );"),
  c("xCharts",'blended "main": [
    {
      "className": ".pizza",
      "data": [
        {
          "x": "Pepperoni",
          "y": 12
        },
        {
          "x": "Cheese",
          "y": 8
        }
      ]
    }
  ]',"myChart = new xChart(chartType, data, '#chart1b4828a41187')")
),stringsAsFactors = FALSE)
colnames(libraryData) <- c("library","dataformat","jscall")


# Initial Thoughts
# it seems to me that 1 is probably the best choice if we only choose 1
# does not have the repetition of #2 in that column names not repeated for each record
# maintain column meta data which is not provided explicitly with #3
# so to experiment with lodash, write some sample data to json files

require(rCharts)
writeLines(to_json(iris, "columns"),"iris.json")
writeLines(to_json(data.frame(HairEyeColor), "columns"),"haireye.json")



# lodash js to get in proper format assuming method #1 json
# records with only lodash
_.map(_.unzip(data),function(d){return _.zipObject(_.keys(data),d)})
# records using blend of d3 and lodash
_.map(_.unzip(data),function(d){return _.zipObject(d3.keys(data),d)})
# values
_.unzip(data)