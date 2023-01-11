<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:useBean id="listArticlesWeek" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>
<jsp:useBean id="listArticlesView" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>
<jsp:useBean id="listArticlesDate" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>
<jsp:useBean id="listArticlesCAT" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>
<jsp:useBean id="listTags" scope="request" type="java.util.List<com.newspaper.app.beans.Tags>"/>

<t:main>
    <jsp:body>

        <div class="container-fluid paddding mb-5">
            <div class="row mx-0">
                <div class="col-md-6 col-12 paddding animate-box" data-animate-effect="fadeIn">
                    <div class="fh5co_suceefh5co_height"><img src="${listArticlesWeek.get(0).picture_main}" width="960px" height="640px" alt="img"/>
                        <div class="fh5co_suceefh5co_height_position_absolute"></div>
                        <div class="fh5co_suceefh5co_height_position_absolute_font">
                            <div class=""><a href="#" class="color_fff"> <i class="fa fa-clock-o"></i>${listArticlesWeek.get(0).publish_date}
                            </a></div>
                            <div class=""><a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${listArticlesWeek.get(0).id}" class="fh5co_good_font"> ${listArticlesWeek.get(0).tittle} </a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6 col-6 paddding animate-box" data-animate-effect="fadeIn">
                            <div class="fh5co_suceefh5co_height_2"><img src="${listArticlesWeek.get(1).picture_main}" width="480px" height="300px" alt="img"/>
                                <div class="fh5co_suceefh5co_height_position_absolute"></div>
                                <div class="fh5co_suceefh5co_height_position_absolute_font_2">
                                    <div class=""><a href="#" class="color_fff"> <i class="fa fa-clock-o"></i>&nbsp;&nbsp;${listArticlesWeek.get(1).publish_date} </a></div>
                                    <div class=""><a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${listArticlesWeek.get(1).id}" class="fh5co_good_font_2"> ${listArticlesWeek.get(1).tittle} </a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-6 paddding animate-box" data-animate-effect="fadeIn">
                            <div class="fh5co_suceefh5co_height_2"><img src="${listArticlesWeek.get(4).picture_main}" width="480px" height="320px" alt="img"/>
                                <div class="fh5co_suceefh5co_height_position_absolute"></div>
                                <div class="fh5co_suceefh5co_height_position_absolute_font_2">
                                    <div class=""><a href="#" class="color_fff"> <i class="fa fa-clock-o"></i>&nbsp;&nbsp;${listArticlesWeek.get(4).publish_date} </a></div>
                                    <div class=""><a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${listArticlesWeek.get(4).id}" class="fh5co_good_font_2"> ${listArticlesWeek.get(4).tittle} </a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-6 paddding animate-box" data-animate-effect="fadeIn">
                            <div class="fh5co_suceefh5co_height_2"><img src="${listArticlesWeek.get(2).picture_main}" width="480px" height="320px" alt="img"/>
                                <div class="fh5co_suceefh5co_height_position_absolute"></div>
                                <div class="fh5co_suceefh5co_height_position_absolute_font_2">
                                    <div class=""><a href="#" class="color_fff"> <i class="fa fa-clock-o"></i>&nbsp;&nbsp;${listArticlesWeek.get(2).publish_date} </a></div>
                                    <div class=""><a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${listArticlesWeek.get(2).id}" class="fh5co_good_font_2"> ${listArticlesWeek.get(2).tittle} </a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-6 paddding animate-box" data-animate-effect="fadeIn">
                            <div class="fh5co_suceefh5co_height_2"><img src="${listArticlesWeek.get(3).picture_main}" width="480px" height="274px" alt="img"/>
                                <div class="fh5co_suceefh5co_height_position_absolute"></div>
                                <div class="fh5co_suceefh5co_height_position_absolute_font_2">
                                    <div class=""><a href="#" class="color_fff"> <i class="fa fa-clock-o"></i>&nbsp;&nbsp;${listArticlesWeek.get(3).publish_date} </a></div>
                                    <div class=""><a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${listArticlesWeek.get(3).id}" class="fh5co_good_font_2"> ${listArticlesWeek.get(3).tittle} </a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid pt-3">
            <div class="container animate-box" data-animate-effect="fadeIn">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Xem nhiều nhất</div>
                </div>
                <div class="owl-carousel owl-theme js" id="slider1">
                    <c:forEach  items="${listArticlesView}" var="c">
                        <div class="item px-2">
                            <div class="fh5co_latest_trading_img_position_relative">
                                <div class="fh5co_latest_trading_img"><img src="${c.picture_main}" width="320px" height="480px" alt=""
                                                                           class="fh5co_img_special_relative"/></div>
                                <div class="fh5co_latest_trading_img_position_absolute"></div>
                                <div class="fh5co_latest_trading_img_position_absolute_1">
                                    <a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${c.id}" class="text-white"> ${c.tittle}</a>
                                    <div class="fh5co_latest_trading_date_and_name_color"> ${c.publish_date}}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="container-fluid pb-4 pt-5">
            <div class="container animate-box">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Mới nhất</div>
                </div>
                <div class="owl-carousel owl-theme" id="slider2">
                    <c:forEach items="${listArticlesDate}" var="c" >
                    <div class="item px-2">
                        <div class="fh5co_hover_news_img">
                            <div class="fh5co_news_img"><img src="${c.picture_main}" width="200" height="200" alt="img"/></div>
                            <div>
                                <a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${c.id}" class="d-block fh5co_small_post_heading"><span class="">${c.tittle}</span></a>
                                <div class="c_g"><i class="fa fa-clock-o"></i> ${c.publish_date}</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="container-fluid pt-3">
            <div class="container animate-box" data-animate-effect="fadeIn">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Top 10 chuyên mục</div>
                </div>
                <div class="owl-carousel owl-theme js" id="slider3">
                    <c:forEach  items="${listArticlesCAT}" var="c">
                        <div class="item px-2">
                            <div class="fh5co_latest_trading_img_position_relative">
                                <div class="fh5co_latest_trading_img"><img src="${c.picture_main}" width="320px" height="480px" alt=""
                                                                           class="fh5co_img_special_relative"/></div>
                                <div class="fh5co_latest_trading_img_position_absolute"></div>
                                <div class="fh5co_latest_trading_img_position_absolute_1">
                                    <a href="single.html" class="text-white"> ${c.tittle}</a>
                                    <div class="fh5co_latest_trading_date_and_name_color"> ${c.publish_date}}</div>
                                    <a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${c.id}" class="text-white"> ${c.categories_id}</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>








        <div class="container-fluid pb-4 pt-4 paddding">
            <div class="container paddding">
                <div class="row mx-0">
                    <div class="col-md-8 animate-box" data-animate-effect="fadeInLeft">
                        <div>
                            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">News</div>
                        </div>
                        <div class="row pb-4">
                            <div class="col-md-5">
                                <div class="fh5co_hover_news_img">
                                    <div class="fh5co_news_img"><img src="${pageContext.request.contextPath}/template/blog/images/nathan-mcbride-229637.jpg" alt=""/></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="col-md-7 animate-box">
                                <a href="single.html" class="fh5co_magna py-2"> Magna aliqua ut enim ad minim veniam quis
                                    nostrud quis xercitation ullamco. </a> <a href="single.html" class="fh5co_mini_time py-3"> Thomson Smith -
                                April 18,2016 </a>
                                <div class="fh5co_consectetur"> Amet consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                </div>
                            </div>
                        </div>
                        <div class="row pb-4">
                            <div class="col-md-5">
                                <div class="fh5co_hover_news_img">
                                    <div class="fh5co_news_img"><img src="${pageContext.request.contextPath}/template/blog/images/ryan-moreno-98837.jpg" alt=""/></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <a href="single.html" class="fh5co_magna py-2"> Magna aliqua ut enim ad minim veniam quis
                                    nostrud quis xercitation ullamco. </a> <a href="#" class="fh5co_mini_time py-3"> Thomson Smith -
                                April 18,2016 </a>
                                <div class="fh5co_consectetur"> Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                    commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                                    dolore.
                                </div>
                                <ul class="fh5co_gaming_topikk pt-3">
                                    <li> Why 2017 Might Just Be the Worst Year Ever for Gaming</li>
                                    <li> Ghost Racer Wants to Be the Most Ambitious Car Game</li>
                                    <li> New Nintendo Wii Console Goes on Sale in Strategy Reboot</li>
                                    <li> You and Your Kids can Enjoy this News Gaming Console</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row pb-4">
                            <div class="col-md-5">
                                <div class="fh5co_hover_news_img">
                                    <div class="fh5co_news_img">
                                        <img src="${pageContext.request.contextPath}/template/blog/images/photo-1449157291145-7efd050a4d0e-578x362.jpg" alt=""/>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <a href="single.html" class="fh5co_magna py-2"> Magna aliqua ut enim ad minim veniam quis
                                    nostrud quis xercitation ullamco. </a> <a href="#" class="fh5co_mini_time py-3"> Thomson Smith -
                                April 18,2016 </a>
                                <div class="fh5co_consectetur"> Quis nostrud xercitation ullamco laboris nisi aliquip ex ea commodo
                                    consequat.
                                </div>
                            </div>
                        </div>
                        <div class="row pb-4">
                            <div class="col-md-5">
                                <div class="fh5co_hover_news_img">
                                    <div class="fh5co_news_img"><img src="${pageContext.request.contextPath}/template/blog/images/office-768x512.jpg" alt=""/></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <a href="single.html" class="fh5co_magna py-2"> Magna aliqua ut enim ad minim veniam quis
                                    nostrud quis xercitation ullamco. </a> <a href="#" class="fh5co_mini_time py-3"> Thomson Smith -
                                April 18,2016 </a>
                                <div class="fh5co_consectetur"> Amet consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 animate-box" data-animate-effect="fadeInRight">
                        <div>
                            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Tags</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="fh5co_tags_all">
                            <c:forEach items="${listTags}" var="t">
                                <a href="#" class="fh5co_tagg">${t.value}</a>
                            </c:forEach>
                        </div>
                        <div>
                            <div class="fh5co_heading fh5co_heading_border_bottom pt-3 py-2 mb-4">Most Popular</div>
                        </div>
                        <div>
                            <jsp:include page="/views/partials/category_left.jsp" />
                        </div>
                        <div class="row pb-3">
                        <%--<div class="col-5 align-self-center">
                                <img src="${pageContext.request.contextPath}/template/blog/images/download (1).jpg" alt="img" class="fh5co_most_trading"/>
                            </div>
                            <div class="col-7 paddding">
                                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
                            </div>--%>
                        </div>
                        <<%--div class="row pb-3">
                            <div class="col-5 align-self-center">
                                <img src="${pageContext.request.contextPath}/template/blog/images/allef-vinicius-108153.jpg" alt="img" class="fh5co_most_trading"/>
                            </div>
                            <div class="col-7 paddding">
                                <div class="most_fh5co_treding_font"> Enim ad minim veniam nostrud xercitation ullamco.</div>
                                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
                            </div>
                        </div>
                        <div class="row pb-3">
                            <div class="col-5 align-self-center">
                                <img src="${pageContext.request.contextPath}/template/blog/images/download (2).jpg" alt="img" class="fh5co_most_trading"/>
                            </div>
                            <div class="col-7 paddding">
                                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
                            </div>
                        </div>
                        <div class="row pb-3">
                            <div class="col-5 align-self-center"><img src="${pageContext.request.contextPath}/template/blog/images/seth-doyle-133175.jpg" alt="img"
                                                                      class="fh5co_most_trading"/></div>
                            <div class="col-7 paddding">
                                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <div class="row mx-0 animate-box" data-animate-effect="fadeInUp">
                    <div class="col-12 text-center pb-4 pt-4">
                        <a href="#" class="btn_mange_pagging"><i class="fa fa-long-arrow-left"></i>&nbsp;&nbsp; Previous</a>
                        <a href="#" class="btn_pagging">1</a>
                        <a href="#" class="btn_pagging">2</a>
                        <a href="#" class="btn_pagging">3</a>
                        <a href="#" class="btn_pagging">...</a>
                        <a href="#" class="btn_mange_pagging">Next <i class="fa fa-long-arrow-right"></i>&nbsp;&nbsp; </a>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>