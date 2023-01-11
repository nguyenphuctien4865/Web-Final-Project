<%--
  Created by IntelliJ IDEA.
  User: tienc
  Date: 1/11/2023
  Time: 5:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="listArticles" scope="request" type="java.util.List<com.newspaper.app.beans.Articles>"/>
<jsp:useBean id="Tags" scope="request" type="java.util.List<com.newspaper.app.beans.Tags>"/>


<t:main>
  <jsp:body>
    <div class="container-fluid pb-4 pt-4 paddding">
      <div class="container paddding">
        <div class="row mx-0">
          <div class="col-md-8 animate-box" data-animate-effect="fadeInLeft">
            <div>
              <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">News</div>
            </div>
            <c:forEach  items="${listArticles}" var="t">
              <div class="row pb-4">
                <div class="col-md-5">
                  <div class="fh5co_hover_news_img">
                    <div class="fh5co_news_img"><img src="${t.picture_main}" width="280" height="150" alt=""/></div>
                    <div></div>
                  </div>
                </div>
                <div class="col-md-7 animate-box">
                  <a href="${pageContext.request.contextPath}/Home/ViewDetail?id=${t.id}" class="fh5co_magna py-2"> ${t.tittle} </a> <a href="#" class="fh5co_mini_time py-3"> ${t.publish_date}</a>
                  <div class="fh5co_consectetur">${t['abstract']}
                  </div>
                </div>
              </div>
            </c:forEach>

           <%-- <div class="row pb-4">
              <div class="col-md-5">
                <div class="fh5co_hover_news_img">
                  <div class="fh5co_news_img"><img src="images/ryan-moreno-98837.jpg" alt=""/></div>
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
                    <img src="images/photo-1449157291145-7efd050a4d0e-578x362.jpg" alt=""/>
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
                  <div class="fh5co_news_img"><img src="images/office-768x512.jpg" alt=""/></div>
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
            </div>--%>
          </div>
          <div class="col-md-3 animate-box" data-animate-effect="fadeInRight">
            <div>
              <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Tags</div>
            </div>
            <div class="clearfix"></div>
            <div class="fh5co_tags_all">
              <<c:forEach items="${Tags}" var="t">
              <a href="#" class="fh5co_tagg">${t.value}</a>
            </c:forEach>
            </div>
            <div>
              <jsp:include page="partials/category_left.jsp"/>
            </div>
            <%--<div class="row pb-3">
              <div class="col-5 align-self-center">
                <img src="images/download (1).jpg" alt="img" class="fh5co_most_trading"/>
              </div>
              <div class="col-7 paddding">
                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
              </div>
            </div>
            <div class="row pb-3">
              <div class="col-5 align-self-center">
                <img src="images/allef-vinicius-108153.jpg" alt="img" class="fh5co_most_trading"/>
              </div>
              <div class="col-7 paddding">
                <div class="most_fh5co_treding_font"> Enim ad minim veniam nostrud xercitation ullamco.</div>
                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
              </div>
            </div>
            <div class="row pb-3">
              <div class="col-5 align-self-center">
                <img src="images/download (2).jpg" alt="img" class="fh5co_most_trading"/>
              </div>
              <div class="col-7 paddding">
                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
              </div>
            </div>
            <div class="row pb-3">
              <div class="col-5 align-self-center"><img src="images/seth-doyle-133175.jpg" alt="img"
                                                        class="fh5co_most_trading"/></div>
              <div class="col-7 paddding">
                <div class="most_fh5co_treding_font"> Magna aliqua ut enim ad minim veniam quis nostrud.</div>
                <div class="most_fh5co_treding_font_123"> April 18, 2016</div>
              </div>
            </div>--%>
          </div>
        </div>
        <div class="row mx-0">
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
    <div class="container-fluid pb-4 pt-5">
      <div class="container animate-box">
        <div>
          <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4">Trending</div>
        </div>
        <div class="owl-carousel owl-theme" id="slider2">
          <div class="item px-2">
            <div class="fh5co_hover_news_img">
              <div class="fh5co_news_img"><img src="images/39-324x235.jpg" alt=""/></div>
              <div>
                <a href="#" class="d-block fh5co_small_post_heading"><span class="">The top 10 best computer speakers in the market</span></a>
                <div class="c_g"><i class="fa fa-clock-o"></i> Oct 16,2017</div>
              </div>
            </div>
          </div>
          <div class="item px-2">
            <div class="fh5co_hover_news_img">
              <div class="fh5co_news_img"><img src="images/joe-gardner-75333.jpg" alt=""/></div>
              <div>
                <a href="#" class="d-block fh5co_small_post_heading"><span class="">The top 10 best computer speakers in the market</span></a>
                <div class="c_g"><i class="fa fa-clock-o"></i> Oct 16,2017</div>
              </div>
            </div>
          </div>
          <div class="item px-2">
            <div class="fh5co_hover_news_img">
              <div class="fh5co_news_img"><img src="images/ryan-moreno-98837.jpg" alt=""/></div>
              <div>
                <a href="#" class="d-block fh5co_small_post_heading"><span class="">The top 10 best computer speakers in the market</span></a>
                <div class="c_g"><i class="fa fa-clock-o"></i> Oct 16,2017</div>
              </div>
            </div>
          </div>
          <div class="item px-2">
            <div class="fh5co_hover_news_img">
              <div class="fh5co_news_img"><img src="images/seth-doyle-133175.jpg" alt=""/></div>
              <div>
                <a href="#" class="d-block fh5co_small_post_heading"><span class="">The top 10 best computer speakers in the market</span></a>
                <div class="c_g"><i class="fa fa-clock-o"></i> Oct 16,2017</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </jsp:body>
</t:main>
