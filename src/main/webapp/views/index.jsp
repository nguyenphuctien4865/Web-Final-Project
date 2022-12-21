<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>

    <jsp:body>
        <div class="container-fluid">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/public/img/main.jpg" alt="Los Angeles" width="1100" height="500">
                        <div class="carousel-caption">
                            <h3>Los Angeles</h3>
                            <p>We had such a great time in LA!</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/public/img/2.jpg" alt="Chicago" width="1100" height="500">
                        <div class="carousel-caption">
                            <h3>Chicago</h3>
                            <p>Thank you, Chicago!</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/public/img/main.jpg" alt="New York" width="1100" height="500">
                        <div class="carousel-caption">
                            <h3>New York</h3>
                            <p>We love the Big Apple!</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <h2><i class="fa fa-align-justify" aria-hidden="true"></i>
                            Mới nhất
                            </h2>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mn-img">
                                        <img src="${pageContext.request.contextPath}/public/img/1.jpg" />
                                    </div>
                                    <div class="mn-content">
                                        <a class="mn-title" href="">Cras commodo sem ut porta laoreet</a>
                                        <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed porta dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos...
                                        </p>
                                    </div>

                                    <div class="mn-img">
                                        <img src="${pageContext.request.contextPath}/public/img/1.jpg" />
                                    </div>
                                    <div class="mn-content">
                                        <a class="mn-title" href="">Cras commodo sem ut porta laoreet</a>
                                        <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed porta dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos...
                                        </p>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid"/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" alt=""/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid"/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <h2><i class="fa fa-align-justify" aria-hidden="true"></i>
                                Xem nhiều nhất
                            </h2>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mn-img">
                                        <img src="../public/img/1.jpg" />
                                    </div>
                                    <div class="mn-content">
                                        <a class="mn-title" href="">Cras commodo sem ut porta laoreet</a>
                                        <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed porta dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos...
                                        </p>
                                    </div>

                                    <div class="mn-img">
                                        <img src="../public/img/1.jpg" />
                                    </div>
                                    <div class="mn-content">
                                        <a class="mn-title" href="">Cras commodo sem ut porta laoreet</a>
                                        <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed porta dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos...
                                        </p>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid"/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="${pageContext.request.contextPath}/public/img/2.jpg" class="img-fluid"/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid"/>
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                    <div class="mn-list">
                                        <div class="mn-img">
                                            <img src="../public/img/2.jpg" class="img-fluid" />
                                        </div>
                                        <div class="mn-content">
                                            <a class="mn-title" href="">Proin id pretium orci, quis rhoncus eros</a>
                                            <a class="mn-date" href=""><i class="far fa-clock"></i>05-Feb-2020</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
                <div class="col-md-4">
                    <jsp:include page="/views/partials/category_left.jsp" />
                </div>
            </div>

            <div class="top-categories">
                <div class="row">
                <div class="container-fluid">
                    <div class="col-md-10 offset-1 ">
                        <div class="row">
                            <div class="container d-flex flex-wrap align-items-center">
                                <div class="card card-category" style="width:13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>

                                <div class="card card-category" style="width: 13rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="card-deck">
                        </div>--%>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </jsp:body>
</t:main>