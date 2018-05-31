<%--
  Created by IntelliJ IDEA.
  User: 16689
  Date: 2017/7/1
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>知识图谱学习</title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@include file="../config.jsp" %>

</head>
<body>
<!-- LEFT SIDEBAR -->
<div>

    <jsp:include page="navbar.jsp"></jsp:include>
</div>
<div class="leftnav">

    <jsp:include page="leftside.jsp"></jsp:include>
</div>
<!-- MAIN -->
<div class="container fixmain">
    <div class="row clearfix">
        <div class="col-md-12 column ">
            <ul class="breadcrumb">

                <li>
                    <a href="#">课程中心</a>
                </li>
                <li class="active">
                    章节学习
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
            <div class="panel-body">
                <c:choose>

                    <c:when test="${fn:length(sessionScope.graph.chapterPageArrayList)==0}">
                        <h3 class="text-center">当前的课程章节结构需要教师确定，我们会尽快联系教师</h3>
                    </c:when>
                    <c:when test="${fn:length(sessionScope.graph.chapterPageArrayList)!=0}">
                        <div class="row clearfix">


                            <div class="col-md-6 column">
                                <div style="height: 500px;" id="canvas">
                                    <script src="http://demo.qunee.com/lib/qunee-min.js"></script>
                                    <script type="text/javascript">
                                        var graph = new Q.Graph("canvas");
                                        var nodes = [];
                                        var node = new Array();

                                        function createRandomEdge(from, to) {


                                            return graph.createEdge(from, to);

                                        }

                                        function Drawnode(name, i, key) {

                                            if (key == 1) {
                                                node[i] = graph.createNode(name);
                                                node[i].size = {width: 30};
                                                node[i].image = "img/model2.png";
                                                nodes.push(node[i]);
                                            }
                                            else {
                                                node[i] = graph.createNode(name);
                                                node[i].size = {width: 30};
                                                node[i].image = "img/model.png";
                                                nodes.push(node[i]);
                                            }

                                        }

                                        function DrawEdge(i, j) {


                                            createRandomEdge(node[i], node[j]);

                                        }


                                        function Star() {//设置布局

                                            var layouter = new Q.SpringLayouter(graph);
                                            layouter.repulsion = 70;
                                            layouter.attractive = 0.5;
                                            layouter.elastic = 5;
                                            layouter.start();
                                            /*#elasticity - 弹性系数
                                             数值越大，连线收缩越短，参考值0-10
                                             #attractive - 中心吸引力系数
                                             数值越大，整体分布越密集，参考值0-1
                                             #repulsion - 斥力系数
                                             数值越大，节点之间的间距越大，参考值0-100*/
                                        }

                                    </script>

                                    <c:forEach var="i" begin="0" end="${sessionScope.graph.chaptercount}" step="1">


                                        <c:if test="${i!=sessionScope.graph.chaptercount}">
                                            <script>

                                                Drawnode("${sessionScope.graph.chapterPageArrayList[i].name}", "${i}", "${sessionScope.graph.finishchapter[i]}");</script>

                                        </c:if>

                                    </c:forEach>

                                    <c:forEach var="i" begin="0" end="${sessionScope.graph.chaptercount}" step="1">

                                        <c:forEach var="j" begin="0" end="${sessionScope.graph.chaptercount}"
                                                   step="1">
                                            <c:if test="${(i!=sessionScope.graph.chaptercount)&&(j!=sessionScope.graph.chaptercount)}">
                                                <c:if test="${sessionScope.graph.graph[i][j]==1}">
                                                    <script>
                                                        DrawEdge("${i}", "${j}");</script>

                                                </c:if>


                                            </c:if>

                                        </c:forEach>
                                    </c:forEach>
                                    <script> Star()</script>
                                </div>

                            </div>
                            <div class="col-md-6 column" style="color: #00aa00">
                                <div class="row clearfix">
                                    <div class="col-md-6 column">
                                        <h3>已学习的章节</h3>
                                        <ul>

                                            <c:forEach var="i" begin="0" end="${sessionScope.graph.finishedcount}"
                                                       step="1">
                                                <c:if test="${i!=sessionScope.graph.finishedcount}">
                                                    <li>
                                                        <a
                                                                href="../LearnChapter?id=${sessionScope.graph.finishedchapter[i].id}">${sessionScope.graph.finishedchapter[i].name} </a>
                                                    </li>


                                                </c:if>

                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 column" style="color: red">
                                        <h3>可选章节</h3>
                                        <ul>
                                            <c:forEach var="i" begin="0" end="${sessionScope.graph.learncount}"
                                                       step="1">
                                                <c:if test="${i!=sessionScope.graph.learncount}">
                                                    <li>
                                                        <a href="../LearnChapter?id=${sessionScope.graph.learnchapter[i].id}">${sessionScope.graph.learnchapter[i].name} </a>
                                                    </li>

                                                </c:if>

                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>
                </c:choose>

            </div>
        </div>
    </div>
</div>

</body>


</html>
