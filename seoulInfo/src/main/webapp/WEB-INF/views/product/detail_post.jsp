<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html><!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4821" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <style>@media (min-width:992px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}@media (max-width:991px) and (min-width:768px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}</style>
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
  <!-- Include jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Include bxSlider CSS file -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <!-- Include bxSlider JavaScript file -->
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
  <style>
	.rating {
	  display: flex;
	  align-items: center;
	  font-size: 1.8rem;
	  color: #ffc107; /* Star color */
	}
	.rating span {
	  font-size: 1rem;
	  color: #333; /* Text color */
	  margin-right: 0.5rem;
	}
		
	.btn-chat {
	  background-color: grey;
	  border-color: grey;
	}
	
	.btn-buy {
	  background-color: black;
	  border-color: black;
	}	
	
	.author-name {
	    color: white; /* Make the text color white */
	    text-decoration: none; /* Remove underline */
	}

	.large-author-wrapper:hover .author-name {
	    text-decoration: none; /* Ensure underline is not added on hover */
	}
	.large-author-wrapper {
	    position: relative; /* Ensure positioning context for the speech bubble */
	}

	.speech-bubble-right {
	    display: none; /* Hidden by default */
	    background-color: #333;
	    color: #fff;
	    text-align: center;
	    border-radius: 5px;
	    padding: 5px;
	    position: absolute; /* Absolute positioning relative to the parent */
	    z-index: 1;
	    margin-left: 10px; /* Adjust as needed to position correctly */
	    white-space: nowrap;
	    font-size: 12px; /* Adjust font size as needed */
	    top: 0; /* Adjust vertical positioning as needed */
	    left: 105%; /* Position it to the right of the parent */
	    cursor: default; /* Prevent cursor change to hand */
	}

	.speech-bubble-right::after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: -10px; /* Adjust as needed to position the triangle */
	    transform: translateY(-50%);
	    border-width: 5px;
	    border-style: solid;
	    border-color: transparent #333 transparent transparent;
	}

	.large-author-wrapper:hover .speech-bubble-right {
	    display: inline-block; /* Show on hover */
	}
	
	.product_detail {
		width: 100%; /* Adjust width as needed */
		height: 150px; /* Height to accommodate 5 rows */
		font-size: 16px; /* Adjust font size as needed */
		padding: 10px; /* Adjust padding as needed */
		box-sizing: border-box; /* Include padding and border in the element's total width and height */
		resize: vertical; /* Allow the user to resize vertically */
	}	
	.loci-image {
	    width: 3%; /* same width as heart-image */
	    height: auto;
	    border-radius: 0;
	    object-fit: contain;
	}		
	.deal_state-image {
	    width: 3%; /* same width as heart-image */
	    height: auto;
	    border-radius: 0;
	    object-fit: contain;
	}		
	.won-image {
	    width: 3%; /* same width as heart-image */
	    height: auto;
	    border-radius: 0;
	    object-fit: contain;
	}	
      .product-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          position: relative;
      }
      .heart-image {
          width: 5%;
          height: auto;
          border-radius: 0;
          object-fit: contain;
          cursor: pointer;
      }
      .speech-bubble {
          display: none;
          background-color: #333;
          color: #fff;
          text-align: center;
          border-radius: 5px;
          padding: 5px;
          position: absolute;
          z-index: 1;
          top: 50%;
          left: 105%;
          transform: translateY(-50%);
          white-space: nowrap;
          font-size: 50%; /* Adjust this value to set the text size to half */
      }
      .speech-bubble::after {
          content: '';
          position: absolute;
          top: 50%;
          left: -10px;
          transform: translateY(-50%);
          border-width: 5px;
          border-style: solid;
          border-color: transparent #333 transparent transparent;
      }
  </style>
  
  <script>
	function showBubble() {
	    document.querySelector('.speech-bubble-right').style.display = 'inline-block';
	}

	function hideBubble() {
	    document.querySelector('.speech-bubble-right').style.display = 'none';
	}	
      function toggleHeart() {
          var img = document.getElementById('heartImage');
          var speechBubble = document.getElementById('speechBubble');
          if (img.src.includes('heart_off.png')) {
              img.src = '/images/heart_on.png';
              speechBubble.textContent = '찜 해제';
          } else {
              img.src = '/images/heart_off.png';
              speechBubble.textContent = '찜하기';
          }
      }

      function showSpeechBubble() {
          var img = document.getElementById('heartImage');
          var speechBubble = document.getElementById('speechBubble');
          if (img.src.includes('heart_off.png')) {
              speechBubble.textContent = '찜하기';
          } else {
              speechBubble.textContent = '찜 해제';
          }
          speechBubble.style.display = 'block';
      }

      function hideSpeechBubble() {
          var speechBubble = document.getElementById('speechBubble');
          speechBubble.style.display = 'none';
      }
  </script>
</head>
<body>
  <div class="page-wrapper">
    <div class="navigation-wrapper background-black">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
          <a href="/" class="brand w-nav-brand"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
          <div class="links-and-search-wrapper">
            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
              <a href="about.html" class="nav-link w-nav-link">About</a>
              <a href="contact.html" class="nav-link w-nav-link">Contact</a>
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
      <div class="section-post-banner background-black">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">
              <h1 data-w-id="180b513c-4540-bab3-7036-972b35d8ddc4" style="opacity:0" class="text-color-white w-dyn-bind-empty"></h1>
              <div class="spacer-xlarge"></div>
              <div data-w-id="771e0065-68e3-960e-1e46-624d6820421c" style="opacity:0" class="post-author-and-tags-wrapper">
				<a href="#" class="large-author-wrapper w-inline-block" onmouseover="showBubble()" onmouseout="hideBubble()">
				    <div class="large-author-thumbnail"></div>
				    <h5 class="author-name">판매자 이름</h5> <!-- Added class 'author-name' -->
				    <div class="speech-bubble-right">대화 매너가 좋아요!</div>
				    <div>
				        <div class="text-size-regular text-color-white w-dyn-bind-empty"></div>
				        <div class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
				    </div>
				</a>
			  </div>
			  <div class="rating">
			    <div class="stars">
			      &#9733; &#9733; &#9733; &#9734; &#9734;
			    </div>
			  </div> 	

			  				  			  
              <div class="spacer-xlarge"></div>
              <div class="image-overflow-wrapper">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="http://placehold.it/400x400" class="d-block w-40 mx-auto" alt="..."> <!-- Added mx-auto class -->
				    </div>
				    <div class="carousel-item">
				      <img src="http://placehold.it/400x400" class="d-block w-40 mx-auto" alt="..."> <!-- Added mx-auto class -->
				    </div>
				    <div class="carousel-item">
				      <img src="http://placehold.it/400x400" class="d-block w-40 mx-auto" alt="..."> <!-- Added mx-auto class -->
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="section-post-text">
        <div class="padding-global">
		  <!-- 상품 상세 설명 --> 	
          <div class="padding-section-medium remove-bottom-padding">
            <div class="container-small">
              <div data-w-id="ea3e6aa5-b9ca-36db-ec21-7072a097305a" style="opacity:0" class="rich-text w-dyn-bind-empty w-richtext"></div>
			  <div>
				<h3 class="product-header">
					상품명				    
				    <img id="heartImage" src="/images/heart_off.png" class="heart-image" onclick="toggleHeart()" onmouseover="showSpeechBubble()" onmouseout="hideSpeechBubble()"/>
				    <div id="speechBubble" class="speech-bubble">찜하기</div>
				</h3>
				<h6>
					<img id="wonImage" src="/images/won.png" class="won-image"/>
					가격
				</h6>
				<h6>
					<img id="deal_stateImage" src="/images/deal_state.png" class="deal_state-image"/>
					거래 상태
				</h6>
				<h6>
					카테고리
				</h6>
				<h6>
					<img id="lociImage" src="/images/loci.png" class="loci-image"/>
					상세 주소
				</h6>
				<div class="form-field-wrapper">
					<label for="Style-Guide-Form-Message"
						class="form-field-label">상품 상세</label>
					<textarea id="Style-Guide-Form-Message" name="Message"
						maxlength="5000" data-name="Message" placeholder="Message"
						class="form-field text-area w-input" readonly></textarea>
				</div>
				<br/>
				<div class="container mt-5 text-center">
				  <button class="button-primary-small w-button">판매자와 채팅</button>
				  <button class="button-primary-small w-button">바로 구입하기</button>
				</div>
				<br/>						
			  <div>
            </div>
          </div>
        </div>
      </div>
      <div class="section-posts-grid background-light-gray">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">
              <h2 data-w-id="9cd55f64-9d5f-e93b-4891-5196167f55bc" style="opacity:0">유사한 상품 추천</h2>
              <div class="spacer-xlarge"></div>
              <div data-w-id="b1e774c6-4b2b-b3d4-cf1a-05e688bc0a4b" style="opacity:0" class="divider-line"></div>
              <div class="spacer-xlarge"></div>
              <div class="w-dyn-list">
                <div role="list" class="_3-column-grid w-dyn-items">
                  <div data-w-id="3685bd48-e5ab-20e0-9347-b40d2d3445f4" style="opacity:0" role="listitem" class="post-grid-collection-item w-dyn-item">
                    <div class="post-grid-wrapper">
                      <a id="w-node-_4786a47f-17a7-4845-3f57-410c5a533ed6-4f5c4821" href="#" class="cms-grid-image-overflow-container w-inline-block">
                        <div data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5" class="cms-grid-image"></div>
                      </a>
                      <div class="tags-wrappers">
                        <a href="#" class="tag w-inline-block">
                          <div class="text-size-small w-dyn-bind-empty"></div>
                        </a>
                        <a href="#" class="tag w-inline-block">
                          <div class="text-size-small w-dyn-bind-empty"></div>
                        </a>
                      </div>
                      <a id="w-node-a84994d4-c317-d35e-36e3-09e254755d94-4f5c4821" href="#" class="w-inline-block">
                        <h3 class="w-dyn-bind-empty"></h3>
                      </a>
                      <div class="small-author-wrapper">
                        <a href="#" class="author-pic-and-name-wrapper w-inline-block">
                          <div class="small-author-thumbnail"></div>
                          <div class="text-size-regular w-dyn-bind-empty"></div>
                        </a>
                        <div class="line-divider"></div>
                        <div class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
                      </div>
                    </div>
                    <div class="grid-post-link-wrapper">
                      <a href="#" class="button-text-only w-button">Read more</a>
                      <a id="w-node-a66acb0f-ee54-d598-d077-87c3081e470b-4f5c4821" href="#" class="button-icon hide-mobile-landscape w-inline-block"><img src="/images/ph_arrow-up-right-light-xxsmall-dark-gray.svg" loading="lazy" alt="" class="icon-1x1-xxsmall"></a>
                    </div>
                  </div>
                </div>
                <div class="empty-state w-dyn-empty">
                  <div class="text-size-regular">No items found.</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="spacer-xxlarge"></div>
    </div>
    <div class="section-newsletter">
      <div class="padding-global">
        <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
          <div class="_2-column-grid-uneven-left">
            <h3 class="newsletter-heading">Love what you see? Sign up for my newsletter and stay in touch.</h3>
            <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
              <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4821" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2"><input class="form-field newsletter w-input" maxlength="256" name="Email" data-name="Email" placeholder="Your email address" type="email" id="Email" required=""><input type="submit" data-wait="Please wait..." class="button-primary-large max-width-full-mobile-portrait w-button" value="Join"></form>
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
        </div>
        <div class="spacer-xxlarge"></div>
      </div>
  
 </div>
  
    </div>
    
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>