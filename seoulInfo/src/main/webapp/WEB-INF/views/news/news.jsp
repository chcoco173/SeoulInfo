<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>JADE&#x27;s Dandy Site</title>
    <meta content="" property="og:title">
    <meta content="" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script type="text/javascript">WebFont.load({ google: { families: ["Plus Jakarta Sans:regular,600,italic,600italic"] }});</script>
    <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
    <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="/images/webclip.png" rel="apple-touch-icon">
	<style>
		/* 상단 nav 와 .destination-banner 를 떨어뜨려 놓음 */
		.navbar_m.w-nav {
		    margin-bottom: 120px; /* 기본 마진 */
		}

		@media (max-width: 768px) {
		    .navbar_m.w-nav {
		        margin-bottom: 10px; /* 작은 화면에서는 마진을 줄임 */
		    }
		}

		@media (max-width: 480px) {
		    .navbar_m.w-nav {
		        margin-bottom: 5px; /* 매우 작은 화면에서는 마진을 더 줄임 */
		    }
		}

	</style>
</head>
<body>
    <div class="page-wrapper">
        <div class="navigation-wrapper">
            <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
                <div class="nav-wrapper">
                    <a href="/" class="brand w-nav-brand"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
                    <div class="links-and-search-wrapper">
                        <nav role="navigation" class="nav-links-wrapper w-nav-menu">
                            <a href="/festival/festival?area=${param.area}" class="nav-link w-nav-link">축제</a>
                            <a href="about.html" class="nav-link w-nav-link">About</a>
                            <a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a>
                        </nav>
                        <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
                            <div class="search-div"><img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
                            <div class="nav-search-outer-wrapper">
                                <div class="nav-search-internal-wrapper"><input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                                    <div class="search-button-wrapper"><input type="submit" class="button-primary-small w-button" value="Search">
                                        <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block"><img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="menu-button w-nav-button"><img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
                </div>
            </div>
        </div>
        
        <div class="main-wrapper">
            <div class="section-destination-banner">
                <div class="padding-global">
                    <div class="padding-section-medium">
                        <div class="container-full-width">
<!--                            <div data-w-id="a984475f-e10a-c912-ac29-53a066823d5a" style="opacity:0" class="_3-column-grid">
                                <div id="w-node-_9eb9e867-d75f-01e1-e35b-5c8e2fc339e3-4f5c4823" data-w-id="9eb9e867-d75f-01e1-e35b-5c8e2fc339e3" style="opacity:0" class="image-overflow-wrapper">
                                    <div id="w-node-a984475f-e10a-c912-ac29-53a066823d5b-4f5c4823" data-w-id="a984475f-e10a-c912-ac29-53a066823d5b" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="destination-featured-image"></div>
                                </div>
                                <div id="w-node-_79c7b98a-1219-4ca1-4497-3bfe7cec81e9-4f5c4823" data-w-id="79c7b98a-1219-4ca1-4497-3bfe7cec81e9" style="opacity:0" class="image-overflow-wrapper">
                                    <div id="w-node-a984475f-e10a-c912-ac29-53a066823d5c-4f5c4823" data-w-id="a984475f-e10a-c912-ac29-53a066823d5c" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="destination-featured-image hide-mobile-landscape"></div>
                                </div>
                                <div id="w-node-_1c6c9f9c-e700-79e7-a980-d3dfc5bb86cd-4f5c4823" data-w-id="1c6c9f9c-e700-79e7-a980-d3dfc5bb86cd" style="opacity:0" class="image-overflow-wrapper">
                                    <div id="w-node-a984475f-e10a-c912-ac29-53a066823d5d-4f5c4823" data-w-id="a984475f-e10a-c912-ac29-53a066823d5d" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="destination-featured-image hide-mobile-landscape"></div>
                                </div>
                            </div>-->
                            <div data-w-id="a984475f-e10a-c912-ac29-53a066823d5e" style="opacity:0" class="destination-banner">
                                <c:forEach items="${newsList}" var="news" varStatus="status">
                                    <c:if test="${status.first}">
                                        <h1 class="text-color-white w-dyn-bind">${news.news_area}</h1>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="section-posts-row">
                <div class="padding-global">
                    <div class="padding-section-medium remove-top-padding">
                        <div class="container-full-width">
                            <h2 data-w-id="e144bf26-0d49-109b-1b5b-756bc18db81f" style="opacity:0">최신 뉴스</h2>
                            <div class="spacer-xlarge"></div>
                            <div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db822" style="opacity:0" class="divider-line"></div>
                            <div class="spacer-xlarge"></div>
                            <div class="w-dyn-list">
                                <div role="list" class="w-dyn-items" id="filteredList">
                                    <c:forEach items="${newsList}" var="news">
                                        <dd data-w-id="e144bf26-0d49-109b-1b5b-756bc18db826" style="opacity:0" role="listitem" class="w-dyn-item">
                                            <div class="post-row-grid">
                                                <a id="w-node-e144bf26-0d49-109b-1b5b-756bc18db828-4f5c4823" data-w-id="e144bf26-0d49-109b-1b5b-756bc18db828" href="/news/newsDetail?news_id=${news.news_id}&area=${news.news_area}" class="post-row-image-overflow-container w-inline-block">
                                                    <img id="w-node-e144bf26-0d49-109b-1b5b-756bc18db829-4f5c4823" data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829" src="${news.news_imageurl}" alt="뉴스 이미지" style="width: 100%; height: auto;" class="post-row-image">
                                                </a>
                                                <div id="w-node-e144bf26-0d49-109b-1b5b-756bc18db82a-4f5c4823" class="post-row-wrapper">
                                                    <div class="tags-wrappers">
                                                        <a href="#" class="tag w-inline-block">
                                                            <div class="text-size-small w-dyn-bind">${news.news_area}</div>
                                                        </a>
                                                    </div>
                                                    <a id="w-node-e144bf26-0d49-109b-1b5b-756bc18db830-4f5c4823" href="/news/newsDetail?news_id=${news.news_id}&area=${news.news_area}" class="w-inline-block">
                                                        <h3 class="w-dyn-bind">${news.news_title}</h3>
                                                    </a>
                                                    <div class="small-author-wrapper">
                                                        <div class="line-divider"></div>
                                                        <div class="text-size-regular text-color-dark-gray w-dyn-bind">
                                                            <fmt:formatDate value="${news.news_date}" pattern="yyyy-MM-dd"/>
                                                        </div>
                                                    </div>
                                                    <div class="small-author-wrapper">
                                                        <div class="line-divider"></div>
                                                        <div class="text-size-regular text-color-dark-gray w-dyn-bind"><a href="${news.news_link}">뉴스 사이트 바로 가기</a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </dd>
                                    </c:forEach>
                                </div>
                                
                                <div role="navigation" aria-label="List" class="w-pagination-wrapper pagination">
                                    <button id="filtered-prevPage" class="w-pagination-previous previous" disabled>
                                        <img src="/images/ph_arrow-left-light-xxsmall.svg" loading="lazy" alt="" class="icon-1x1-xxsmall">
                                        <div class="text-size-small w-inline-block">Previous</div>
                                    </button>
                                    <div id="filtered-pageInfo" class="page-info">1 / 1</div>
                                    <button id="filtered-nextPage" class="w-pagination-next next" disabled>
                                        <div class="text-size-small w-inline-block">Next</div>
                                        <img src="/images/ph_arrow-right-light-xxsmall.svg" loading="lazy" alt="" class="icon-1x1-xxsmall">
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-newsletter">
            <div class="padding-global">
                <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
                    <div class="_2-column-grid-uneven-left">
                        <h3 class="newsletter-heading">Love what you see? Sign up for my newsletter and stay in touch.</h3>
                        <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
                            <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4823" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2"><input class="form-field newsletter w-input" maxlength="256" name="Email" data-name="Email" placeholder="Your email address" type="email" id="Email" required=""><input type="submit" data-wait="Please wait..." class="button-primary-large max-width-full-mobile-portrait w-button" value="Join"></form>
                            <div class="form-success-message w-form-done">
                                <div class="text-size-regular text-color-white">Thank you! Your submission has been received!</div>
                            </div>
                            <div class="form-error-message w-form-fail">
                                <div class="text-size-regular">Oops! Something went wrong while submitting the form.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="section-footer">
            <div class="padding-global">
                <div class="spacer-xxlarge"></div>
                <div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe" class="container-footer">
                    <div class="padding-global">
                        <div class="padding-section-medium">
                            <div class="_2-column-grid">
                                <a href="/" class="w-inline-block"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
                                <div>
                                    <h3>The stories of a travel photographer and blogger exploring the world .</h3>
                                    <div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb" class="spacer-xxlarge"></div>
                                </div>
                            </div>
                            <div class="_2-column-grid footer">
                                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb" class="footer-micro-links-wrapper">
                                    <p class="text-size-small">Website template by <a href="https://www.callistodigitalstudio.com/" target="_blank" class="text-size-small">Callisto Digital Studio</a>.</p>
                                    <p class="text-size-small">Powered by <a href="https://webflow.com/templates/html/sightseer-travel-website-template" target="_blank" class="text-size-small">Webflow</a>.</p>
                                </div>
                                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb" class="_3-column-grid footer-links">
                                    <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
                                        <h4>About</h4>
                                        <div class="spacer-large"></div>
                                        <a href="about.html" class="footer-link">About</a>
                                        <a href="contact.html" class="footer-link">Contact</a>
                                    </div>
                                    <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
                                        <h4>Social</h4>
                                        <div class="spacer-large"></div>
                                        <a href="http://tiktok.com" target="_blank" class="footer-link">TikTok</a>
                                        <a href="http://Instagram.com" target="_blank" class="footer-link">Instagram</a>
                                        <a href="http://Facebook.com" target="_blank" class="footer-link">Facebook</a>
                                        <a href="http://Youtube.com" target="_blank" class="footer-link">Youtube</a>
                                    </div>
                                    <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
                                        <h4>Theme</h4>
                                        <div class="spacer-large"></div>
                                        <a href="template/template-style-guide.html" class="footer-link">Style Guide</a>
                                        <a href="template/changelog.html" class="footer-link">Changelog</a>
                                        <a href="template/licenses.html" class="footer-link">Licenses</a>
                                        <a href="https://webflow.com/templates/designers/callisto-digital-studio" target="_blank" class="footer-link">All Templates</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="spacer-xxlarge"></div>
                </div>
            </div>
        </div>
        
    </div>
    
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="/js/webflow.js" type="text/javascript"></script>
    
    <script>
	// 페이지 넘기기 + 페이지 넘기면 상단으로 스크롤
    $(document).ready(function() {
        var itemsPerPage = 6; // 페이지당 보여줄 항목 수
        var currentPage = 1; // 현재 페이지
        var $filteredItems = $('#filteredList dd'); // 필터링된 항목들
        var totalItems = $filteredItems.length; // 전체 항목 수
        var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수

        function showPage(page) {
            $filteredItems.hide();
            $filteredItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
            $('#filtered-pageInfo').text(page + ' / ' + totalPages);
            $('#filtered-prevPage').prop('disabled', page === 1);
            $('#filtered-nextPage').prop('disabled', page === totalPages);
        }
		
		function scrollToFirstArticle() {
		    $('html, body').animate({
		        scrollTop: $('#filteredList dd:visible:first').offset().top
		    }, 500);
		}

        $('#filtered-prevPage').click(function() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
				scrollToFirstArticle();
            }
        });

        $('#filtered-nextPage').click(function() {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
				scrollToFirstArticle();
            }
        });
		
		// 각 기사의 구를 클릭하면 역시 상단으로 스크롤
		$('.tag.w-inline-block').click(function() {
		    scrollToFirstArticle();
		});

        // 초기 페이지 로드
        showPage(currentPage);
    });
    </script>
</body>
</html>
