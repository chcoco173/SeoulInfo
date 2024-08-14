<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>JADE&#x27;s Dandy Site</title>
	<meta content="" property="og:title">
	<meta content="" property="twitter:title">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	<link href="/css/normalize.css" rel="stylesheet" type="text/css">
	<link href="/css/webflow.css" rel="stylesheet" type="text/css">
	<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
		type="text/css">
	<style>
		
		
		
		.destination-banner {
		    margin-top: -20px; /* 위에 섹션과 겹치지 않도록 여백 추가 */
		}
		.comment-content {
		    width: 100%; /* 댓글 내용 가로로 길게 설정 */
		    word-wrap: break-word; /* 긴 단어 줄바꿈 */
			margin-left:1%;
		}
		.text-size-regular {
		    width: 100%; /* 텍스트 가로로 길게 설정 */
		}
		.post-row-wrapper {
		    display: flex;
		    flex-direction: column;
		    width: 100%; /* post-row-wrapper 가로로 길게 설정 */
		    max-width: 1000px; /* 최대 너비 설정 */
		    margin: 0 auto; /* 가운데 정렬 */
		}
		.post-row-grid, .spacer-xlarge {
		    display: flex;
		    flex-wrap: wrap;
		    width: 100%; /* post-row-grid 가로로 길게 설정 */		   		   
		}
		.post-row-wrapper {
		    display: flex;
		    flex-direction: column;
		    width: 100%; /* post-row-wrapper 가로로 길게 설정 */
		    max-width: 1000px; /* 최대 너비 설정 */
		    margin: 0; /* 가운데 정렬 제거 */
		    padding-left: 15px; /* 왼쪽 여백 추가 */
		}


		.flex-item.text-color-black.review-content {
		    max-width: 75%; /* 최대 너비를 800px로 설정 */
		    margin: 0 auto; /* 가운데 정렬 */
		    padding: 20px; /* 내부 여백 추가 */
		}
		.padding-section-medium.remove-top-padding {
		    max-width: 80%; /* 최대 너비를 1200px로 설정 */
		    margin: 0 auto; /* 가운데 정렬 */
		    padding: 20px; /* 내부 여백 추가 */
		}

		
		@media (min-width:992px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}@media (max-width:991px) and (min-width:768px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}</style>
	<link href="https://fonts.googleapis.com" rel="preconnect">
	<link href="https://fonts.gstatic.com" rel="preconnect"
		crossorigin="anonymous">
	<script
		src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		WebFont.load({
			google : {
				families : [ "Plus Jakarta Sans:regular,600,italic,600italic" ]
			}
		});
	</script>
	<script type="text/javascript">
		!function(o, c) {
			var n = c.documentElement, t = " w-mod-";
			n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch
					&& c instanceof DocumentTouch)
					&& (n.className += t + "touch")
		}(window, document);
	</script>
	<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link href="/images/webclip.png" rel="apple-touch-icon">
	</head>
<body>
	<div class="page-wrapper">
		<!-- 검색창 start -->
		<div class="page-wrapper">
			<div class="navigation-wrapper">
				<div data-animation="default" data-collapse="medium"
					data-duration="400" data-easing="ease" data-easing2="ease"
					role="banner" class="navbar_m w-nav">
					<div class="nav-wrapper">
						<a href="/" aria-current="page"
							class="brand w-nav-brand w--current"> <img
							src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
							alt="">
						</a>
						<div class="links-and-search-wrapper">
							<%
								if (session.getAttribute("member") != null) {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
									class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
									class="nav-link w-nav-link">로그아웃</a>
							</nav>
							<%
								} else {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/member/login"
									class="nav-link w-nav-link">로그인</a>
							</nav>
							<%
								}
							%>
							<form action="/search"
								data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
								class="search w-form">
								<div class="search-div">
									<img src="/images/ph_magnifying-glass-light-xsmall.svg"
										loading="lazy" alt="" class="icon-1x1-xsmall">
								</div>
								<div class="nav-search-outer-wrapper">
									<div class="nav-search-internal-wrapper">
										<input class="form-field w-input" maxlength="256" name="query"
											placeholder="Search…" type="search" id="search" required="">
										<div class="search-button-wrapper">
											<input type="submit" class="button-primary-small w-button"
												value="Search"> <a
												data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
												class="close-search-link-block w-inline-block"> <img
												src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
												class="icon-1x1-xsmall">
											</a>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="menu-button w-nav-button">
							<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
								class="icon-1x1-xsmall">
						</div>
					</div>
				</div>
			</div>
		<!-- 검색창 end -->
		<!-- 리뷰 사진 start -->
		<div class="main-wrapper">
		    <div class="section-destination-banner">
		        <div class="padding-global">
		            <div class="padding-section-medium">
		                <div class="container-full-width">
		                    <div data-w-id="a984475f-e10a-c912-ac29-53a066823d5a" style="opacity:0" class="_3-column-grid">
		                        <c:forEach items="${images}" var="image">
		                            <div id="w-node-_9eb9e867-d75f-01e1-e35b-5c8e2fc339e3-4f5c4823" data-w-id="9eb9e867-d75f-01e1-e35b-5c8e2fc339e3" style="opacity:0" class="image-overflow-wrapper">
		                                <div id="w-node-a984475f-e10a-c912-ac29-53a066823d5b-4f5c4823" data-w-id="a984475f-e10a-c912-ac29-53a066823d5b" style="background-image: url('${image.fr_imgUrl}'); -webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform-style:preserve-3d" class="destination-featured-image">											
										</div>
		                            </div>
		                        </c:forEach>
		                    </div>
							<div data-w-id="a984475f-e10a-c912-ac29-53a066823d5e" style="opacity:0" class="destination-banner">
							    <a href="/author/${review.member_id}" class="large-author-wrapper w-inline-block">
							        <div style="background-image:url('${memberImageUrl}')" class="large-author-thumbnail"></div>
							        <div>
							            <div class="text-size-regular text-color-white">${review.member_id}</div>
							            <div class="text-size-regular text-color-dark-gray">
							                <fmt:formatDate value="${review.fr_regdate}" pattern="yyyy-MM-dd" />
							            </div>
							        </div>
							    </a>
								<br>
								<c:if test="${sessionScope.member != null && sessionScope.member.member_id == review.member_id}">
								    <div class="review-buttons">
								        <input type="hidden" id="fr_id" name="fr_id" value="${review.fr_id}">
								        <input type="hidden" id="member_id" name="member_id" value="${review.member_id}">
								        <button class="button-primary-large max-width-full-mobile-portrait w-button edit">내 후기 수정</button>
								        <button class="button-primary-large max-width-full-mobile-portrait w-button delete">내 후기 삭제</button>
								    </div>
								</c:if>
							    <br/>
							    <h1 class="text-color-white">${review.fr_title}</h1>
							</div>
		                </div>
		            </div>
		        </div>
		    </div>
		<!-- 리뷰 사진 end -->
		<!-- 리뷰 내용 start -->
		<div class="main-wrapper">
		    <div class="padding-global">
		        <div class="padding-section-medium">
		            <div class="container-full-width">
		                <div class="flex-container">
		                    <div class="flex-item text-color-black review-content">
		                        <p>${review.fr_content}</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 리뷰 내용 end -->
		<!-- 댓글 리스트 출력 부분 -->
		<div class="section-posts-row">
		    <div class="padding-global">
		        <div class="padding-section-medium remove-top-padding">
		            <div class="container-full-width">
		                <h3>댓글 목록</h3>
		                <div class="spacer-xlarge"></div>
		                <div class="divider-line"></div>
		                <div class="spacer-xlarge"></div>
		                <div class="w-dyn-list">
		                    <div role="list" class="w-dyn-items">
		                        <c:forEach items="${comments}" var="comment">
		                            <div role="listitem" class="w-dyn-item">
		                                <div class="post-row-grid">
		                                    <div class="post-row-wrapper">
		                                        <div class="tags-wrappers">
		                                            <a href="#" class="tag w-inline-block" style="align-self:center; padding:10px 20px 10px 20px;">
		                                                <div class="text-size-small">${comment.member_id}</div>
		                                            </a>
													<div style="margin-left:10px;">
													<!-- 내 댓글 삭제 버튼 -->
													<c:if test="${sessionScope.member != null && sessionScope.member.member_id == comment.member_id}">
													    <button class="button-primary-large max-width-full-mobile-portrait w-button delete-comment" data-comment-id="${comment.frc_id}">내 댓글 삭제</button>
													</c:if>
													<!-- 댓글 신고 버튼 -->
													<c:if test="${sessionScope.member != null && sessionScope.member.member_id != comment.member_id}">
														<button class="button-primary-large max-width-full-mobile-portrait w-button report-comment" data-comment-id="${comment.frc_id}" data-comment-author="${comment.member_id}">댓글 신고</button>													
													</c:if>
													</div>

                								</div>
		                                        <div class="comment-content">
		                                            <p>${comment.frc_content}</p>
		                                            <div class="small-author-wrapper">
		                                                <div class="line-divider"></div>
		                                                <div class="text-size-regular text-color-dark-gray">
		                                                    <fmt:formatDate value="${comment.frc_regdate}" pattern="yyyy-MM-dd" />
		                                                </div>
		                                            </div>
												</div>
		                                    </div>
		                                </div>
		                            </div>
		                        </c:forEach>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 댓글 리스트 end -->
		<!-- 댓글 작성하기 start -->
		<div class="section-newsletter">
			<div class="padding-global">
				<div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd"
					class="container-newsletter background-black">
					<div class="_2-column-grid-uneven-right">
						<h3 class="newsletter-heading">댓글을 작성해주세요!</h3>
						<div id="Style-Guide-Form"
							class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
							<form name="wf-form-Newsletter-Form" data-name="Newsletter Form"
								method="get" id="wf-form-Newsletter-Form"
								class="newsletter-form"
								data-wf-page-id="628ab4b45549af6399a230d3"
								data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
								<input class="form-field newsletter w-input" maxlength="256"
									name="comment" data-name="comment" placeholder="내용을 입력하세요"
									type="text" id="comment" required="" /> 
									<input type="hidden" id="fr_id" name="fr_id" value="${review.fr_id }">
									<input type="submit"
									data-wait="Please wait..."
									class="button-primary-large max-width-full-mobile-portrait w-button"
									value="댓글달기" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 작성하기 end -->

		  
		  <div class="section-footer">
		  	<div class="padding-global">
		  		<div class="spacer-xxlarge"></div>
		  		<div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe"
		  			class="container-footer">
		  			<div class="padding-global">
		  				<div class="padding-section-medium">
		  					<div class="_2-column-grid">
		  						<a href="/" aria-current="page"
		  							class="w-inline-block w--current"><img
		  							src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
		  							alt=""></a>
		  						<div>
		  							<h3>The stories of a travel photographer and blogger
		  								exploring the world .</h3>
		  							<div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb"
		  								class="spacer-xxlarge"></div>
		  						</div>
		  					</div>
		  					<div class="_2-column-grid footer">
		  						<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb"
		  							class="footer-micro-links-wrapper">
		  							<p class="text-size-small">
		  								Website template by <a
		  									href="https://www.callistodigitalstudio.com/" target="_blank"
		  									class="text-size-small">Callisto Digital Studio</a>.
		  							</p>
		  							<p class="text-size-small">
		  								Powered by <a
		  									href="https://webflow.com/templates/html/sightseer-travel-website-template"
		  									target="_blank" class="text-size-small">Webflow</a>.
		  							</p>
		  						</div>
		  						<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb"
		  							class="_3-column-grid footer-links">
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
		  								<h4>About</h4>
		  								<div class="spacer-large"></div>
		  								<a href="about" class="footer-link">About</a> <a
		  									href="contact" class="footer-link">Contact</a>
		  							</div>
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
		  								<h4>Social</h4>
		  								<div class="spacer-large"></div>
		  								<a href="http://tiktok.com" target="_blank"
		  									class="footer-link">TikTok</a> <a href="http://Instagram.com"
		  									target="_blank" class="footer-link">Instagram</a> <a
		  									href="http://Facebook.com" target="_blank"
		  									class="footer-link">Facebook</a> <a href="http://Youtube.com"
		  									target="_blank" class="footer-link">Youtube</a>
		  							</div>
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
		  								<h4>Theme</h4>
		  								<div class="spacer-large"></div>
		  								<a href="template/template-style-guide.html"
		  									class="footer-link">Style Guide</a> <a
		  									href="template/changelog.html" class="footer-link">Changelog</a>
		  								<a href="template/licenses.html" class="footer-link">Licenses</a>
		  								<a
		  									href="https://webflow.com/templates/designers/callisto-digital-studio"
		  									target="_blank" class="footer-link">All Templates</a>
		  							</div>
		  						</div>
		  					</div>
		  				</div>
		  			</div>
		  		</div>
		  		<div class="spacer-xxlarge"></div>
		  	</div>
		  </div>
		  

  <script
  	src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
  	type="text/javascript"
  	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  	crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <!-- 댓글 등록 -->
  <script>
	$(document).ready(function () {
	    $('.delete-comment').click(function () {
	        var commentId = $(this).data('comment-id');
	        $.ajax({
	            type: 'POST',
	            url: '/festival/deleteComment',
	            data: { frc_id: commentId },
	            success: function (response) {
	                if (response === 'success') {
	                    location.reload(); // 댓글 목록을 새로고침하기 위해 페이지 리로드
	                } else {
	                    alert('댓글 삭제에 실패했습니다.');
	                }
	            },
	            error: function () {
	                alert('댓글 삭제 요청 중 오류가 발생했습니다.');
	            }
	        });
	    });

	    $('#wf-form-Newsletter-Form').submit(function (event) {
	        event.preventDefault(); // 기본 폼 제출 이벤트 방지

	        var sessionResult = '<c:out value="${sessionScope.member != null ? sessionScope.member.member_id : ''}" />';
	        var frId = $('#fr_id').val(); // 숨겨진 fr_id 요소의 값을 가져옴
	        var commentContent = $('#comment').val(); // 댓글 내용을 가져옴

	        // 로그인 안되있을 때
	        if (sessionResult === '') {
	            var userConfirmed = confirm("댓글을 달려면 로그인이 필요합니다.");
	            if (userConfirmed) {
	                // 로그인 페이지로 리다이렉트
	                window.location.href = '/member/login';
	            }
	        } else {
	            // AJAX 요청 수행
	            $.ajax({
	                type: 'GET',
	                url: 'insertComment', // 댓글 제출을 위한 URL
	                data: {
	                    fr_id: frId,
	                    comment: commentContent
	                },
	                success: function (response) {
	                    if (response === 'success') {
	                        location.reload(); // 댓글 목록을 새로고침하기 위해 페이지 리로드
	                    } else {
	                        alert(response); // 오류 메시지 표시
	                    }
	                },
	                error: function () {
	                    alert('댓글 등록에 실패했습니다.');
	                }
	            });
	        }
	    });
		
		// 댓글 신고 기능
		$('.report-comment').click(function () {
		    var commentId = $(this).data('comment-id');
		    var commentAuthor = $(this).data('comment-author');
		    console.log("댓글 작성자 신고 " + commentAuthor);
		    window.open('/festival/comment_report?selectedCommentId=' + commentId + '&commentAuthor=' + commentAuthor, "_blank", "width=400,height=500");
		});
		

	    document.querySelectorAll('.review-buttons').forEach(function(buttonContainer) {
	        const reviewId = buttonContainer.querySelector('input[name="fr_id"]').value;
	        console.log("수정 삭제 reviewId " + reviewId);

	        const editButton = buttonContainer.querySelector('.edit');
	        const deleteButton = buttonContainer.querySelector('.delete');

	        editButton.addEventListener('click', function() {
	            window.location.href = "/festival/festivalReview?fr_id=" + reviewId;
	        });

	        deleteButton.addEventListener('click', function() {
	            var userConfirmed = confirm("삭제하시겠습니까?");
	            if (userConfirmed) {
	                // AJAX 요청을 통해 삭제 요청을 서버로 보냅니다.
	                fetch('/festival/deleteReview', {
	                    method: 'POST',
	                    headers: {
	                        'Content-Type': 'application/x-www-form-urlencoded'
	                    },
	                    body: new URLSearchParams({
	                        'fr_id': reviewId
	                    })
	                })
	                .then(response => response.text())
	                .then(result => {
	                    if (result === "success") {
	                        alert("후기가 삭제되었습니다.");
	                        window.location.reload();
	                    } else {
	                        alert("후기 삭제에 실패했습니다.");
	                    }
	                })
	                .catch(error => {
	                    console.error('Error:', error);
	                    alert("후기 삭제 중 오류가 발생했습니다.");
	                });
	            }
	        });
	    });

	});
  </script>	  
</body>

</html>
