<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 1/10/2023
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Articles" scope="request" type="com.newspaper.app.beans.Articles"/>
<jsp:useBean id="Tags" scope="request" type="java.util.List<com.newspaper.app.beans.Tags>"/>
<jsp:useBean id="ListAC" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>

<t:main>
    <jsp:body>


        <div id="fh5co-single-content" class="container-fluid pb-4 pt-4 paddding">
            <div class="container paddding">
                <div class="row mx-0">
                    <div class="col-md-8 animate-box" data-animate-effect="fadeInLeft">
                        <img src="${Articles.picture_main}" alt="Free HTML5 by FreeHTMl5.co" style=" display: block;margin-left: auto;margin-right: auto;width: 100%;; ">
                        <div>${Articles.publish_date}</div>
                        <h2>${Articles.tittle}</h2>
                        <hr>
                        <h6>${Articles['abstract']}</h6>
                        ${Articles.content}
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInRight">
                        <div>
                            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Tags</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="fh5co_tags_all">

                            <c:forEach items="${Tags}" var="t">
                                <a href="#" class="fh5co_tagg">${t.value}</a>
                            </c:forEach>
                        </div>
                        <div>

                            <jsp:include page="/views/partials/category_left.jsp"/>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid pb-4 pt-5">
            <div class="container animate-box">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Liên quan</div>
                </div>
                <div class="owl-carousel owl-theme" id="slider2">
                    <c:forEach items="${ListAC}" var="t">
                        <div class="item px-2">
                            <div class="fh5co_hover_news_img">
                                <div class="fh5co_news_img"><img src="${t.picture_main}"  alt=""/></div>
                                <div>
                                    <a href="#" class="d-block fh5co_small_post_heading"><span class="">${t.tittle}</span></a>
                                    <div class="c_g"><i class="fa fa-clock-o"></i> ${t.publish_date}</div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
