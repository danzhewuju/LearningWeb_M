<%--
  Created by IntelliJ IDEA.
  User: ycbhci
  Date: 2017/6/27
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>学生基本信息</title>
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
                    <a href="#">基本信息</a>
                </li>
                <li class="active">
                    信息查询
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>

            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-4 column">


                        <ul class="list-unstyled">
                            <li>
                                <img src="${sessionScope.studentpage.picture}" class="img-rounded  " alt="照片丢失"
                                     width="100">

                            </li>

                            <li>
                                <h4>昵称 ${sessionScope.studentpage.name}</h4>

                            </li>

                            <li>
                                <h4>生日${sessionScope.studentpage.birthday}</h4>

                            </li>

                            <li>
                                <h4> 性别 ${sessionScope.studentpage.gendar}</h4>


                            </li>

                            <li>
                                <h4>学历 ${sessionScope.studentpage.status}</h4>

                            </li>

                            <li>
                                <h4>年级 ${sessionScope.studentpage.grade}</h4>

                            </li>

                            <li>
                                <h4>邮箱 ${sessionScope.studentpage.email}</h4>

                            </li>

                            <li>
                               <h4>专业 ${sessionScope.studentpage.major}</h4>

                            </li>
                        </ul>
                    </div>

                    <div class="col-md-8 column">
                        <div class="carousel slide" id="carousel-635435">
                            <ol class="carousel-indicators">
                                <li data-slide-to="0" data-target="#carousel-635435">
                                </li>
                                <li data-slide-to="1" data-target="#carousel-635435">
                                </li>
                                <li data-slide-to="2" data-target="#carousel-635435">
                                </li>
                            </ol>
                            <div class="carousel-inner carousel-inner">
                                <div class="item next left">
                                    <img alt="" src="img/inspiring-model.jpg"/>
                                    <div class="carousel-caption">
                                        <h4>
                                            将敬酒
                                        </h4>
                                        <p>
                                            君不见，黄河之水天上来，奔流到海不复回。
                                            君不见，高堂明镜悲白发，朝如青丝暮成雪。
                                            人生得意须尽欢，莫使金樽空对月。
                                            天生我材必有用，千金散尽还复来。
                                            烹羊宰牛且为乐，会须一饮三百杯。
                                            岑夫子，丹丘生，将进酒，杯莫停。
                                            与君歌一曲，请君为我倾耳听。(倾耳听 一作：侧耳听)
                                            钟鼓馔玉不足贵，但愿长醉不复醒。(不足贵 一作：何足贵；不复醒 一作：不愿醒/不用醒)
                                            古来圣贤皆寂寞，惟有饮者留其名。(古来 一作：自古；惟 通：唯)
                                            陈王昔时宴平乐，斗酒十千恣欢谑。
                                            主人何为言少钱，径须沽取对君酌。
                                            五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img alt="" src="img/multicolored-pencils.jpg"/>
                                    <div class="carousel-caption">
                                        <h4>
                                            蜀道难
                                        </h4>
                                        <p>
                                            蜀道之难,难于上青天，使人听此凋朱颜！
                                            连峰去天不盈尺，枯松倒挂倚绝壁。
                                            飞湍瀑流争喧豗，砯崖转石万壑雷。
                                            其险也如此，嗟尔远道之人胡为乎来哉！(也如此 一作：也若此)
                                            剑阁峥嵘而崔嵬，一夫当关，万夫莫开。
                                            所守或匪亲，化为狼与豺。
                                            朝避猛虎，夕避长蛇；磨牙吮血，杀人如麻。
                                            锦城虽云乐，不如早还家。
                                            蜀道之难,难于上青天，侧身西望长咨嗟
                                        </p>
                                    </div>
                                </div>
                                <div class="item active left">
                                    <img alt="" src="img/tyler-gebhart-488825-unsplash.jpg"/>
                                    <div class="carousel-caption">
                                        <h4>
                                            秋风词
                                        </h4>
                                        <p>
                                            秋风清，秋月明，
                                            落叶聚还散，寒鸦栖复惊。
                                            相思相见知何日？此时此夜难为情！
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-635435" data-slide="prev"><span
                                    class="glyphicon glyphicon-chevron-left"></span></a> <a
                                class="right carousel-control" href="#carousel-635435" data-slide="next"><span
                                class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
