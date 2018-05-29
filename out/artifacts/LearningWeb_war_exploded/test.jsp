<%--
  Created by IntelliJ IDEA.
  User: alexanderdan
  Date: 2018/5/29
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="config.jsp"%>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="js/echarts.min.js"></script>


</head>
<body>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    myChart.showLoading();
    var webkitDep = {
        "type": "force",
        "categories": [//关系网类别，可以写多组
            {
                "name": "未学课程",//关系网名称
                "keyword": {},
                "base": "未学课程"
            }
            ,{
                "name": "已学课程",//关系网名称
                "keyword": {},
                "base": "已学课程"

            }
        ],
        "nodes": [//展示的节点
            {
                "name": "刘烨",//节点名称
                "value": 3,
                "category": 0,//与关系网类别索引对应，此处只有一个关系网所以这里写0
                
            },
            {
                "name": "霓娜",
                "value": 1,
                "category": 0
            },
            {
                "name": "诺一",
                "value": 1,
                "category": 0
            }
        ],
        "links": [//节点之间连接
            {
                "source": 0,//起始节点，0表示第一个节点
                "target": 1 //目标节点，1表示与索引为1的节点进行连接
            },
            {
                "source": 0,
                "target": 2
            }
        ]
    };
    myChart.hideLoading();

    option = {
        legend: {
            data: ['未学课程']//此处的数据必须和关系网类别中name相对应
        },
        series: [{
            type: 'graph',
            layout: 'force',
            animation: false,
            label: {
                normal: {
                    show:true,
                    position: 'right'
                }
            },
            draggable: true,
            data: webkitDep.nodes.map(function (node, idx) {
                node.id = idx;
                return node;
            }),
            categories: webkitDep.categories,
            force: {
                edgeLength: 105,//连线的长度
                repulsion: 100  //子节点之间的间距
            },
            edges: webkitDep.links
        }]
    };
    myChart.setOption(option);
</script>

</body>
</html>
