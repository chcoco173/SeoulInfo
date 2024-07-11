<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4829"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>Template Style Guide</title>
<meta content="Template Style Guide" property="og:title">
<meta content="Template Style Guide" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
<link href="/images/favicon.png" rel="shortcut icon"
	type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="page-wrapper">
	<%@include file="../productNav/productNav.jsp"%>
		
		<%@include file="../productNav/productMyPageNav.jsp"%>
		
		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="padding-section-medium remove-bottom-padding">
					<div class="padding-global">
						<div class="container-large">
							<h1>Style Guide</h1>
							<p>
								Here is a summary of some of the main styles used throughout the
								site. If you edit styles here, they will change across the site.<br>
							</p>
						</div>
					</div>
				</div>
			</section>
			<section id="Typography" class="section-style-guide-typography">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Typography</h2>
								<h3>HTML Heading Tags</h3>
								<p>
									HTML tags define default Heading styles.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">H1</div>
									<h1>This is a H1</h1>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">H2</div>
									<h2>This is a H2</h2>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">H3</div>
									<h3>This is a H3</h3>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">H4</div>
									<h4>This is a H4</h4>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">H5</div>
									<h5>This is a H5</h5>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">H6</div>
									<h6>This is a H6</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Typography</h2>
								<h3>Other HTML Tags</h3>
								<p class="text-size-regular">
									HTML tags define default text styles.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">All paragraphs</div>
									<p>
										This is a paragraph.<br>
									</p>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">All Links</div>
									<a href="#">This is a link.</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">All Quotes</div>
									<blockquote>This is a quote.</blockquote>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">All Ordered Lists</div>
									<ol role="list">
										<li>This is an ordered list.</li>
										<li>This is an ordered list.</li>
										<li>This is an ordered list.</li>
									</ol>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">All Unordered Lists</div>
									<ul role="list">
										<li>This is an unordered list.</li>
										<li>This is an unordered list.</li>
										<li>This is an unordered list.</li>
									</ul>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Rich Text</div>
									<div class="rich-text w-richtext">
										<h1>Heading 1</h1>
										<h2>Heading 2</h2>
										<h3>Heading 3</h3>
										<h4>Heading 4</h4>
										<h5>Heading 5</h5>
										<h6>Heading 6</h6>
										<p>
											This is a paragraph with a <a href="http://finsweet.com">link</a>.
										</p>
										<ul role="list">
											<li>This is an unordered list.</li>
											<li>This is an unordered list.</li>
											<li>This is an unordered list.</li>
										</ul>
										<ol start="" role="list">
											<li>This is an ordered list.</li>
											<li>This is an ordered list.</li>
											<li>This is an ordered list.</li>
										</ol>
										<blockquote>This is a quote.</blockquote>
										<figure
											class="w-richtext-align-normal w-richtext-figure-type-image">
											<div>
												<img src="../images/image.svg" loading="lazy" alt="">
											</div>
										</figure>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Typography</h2>
								<h3>Heading Styles</h3>
								<p>
									Use these text classes when the visual typography style you
									want doesn&#x27;t match the default HTML tag.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H1</div>
									<h1 class="heading-style-h1">This is Heading style H1.</h1>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H2</div>
									<h2 class="heading-style-h2">This is Heading style H2.</h2>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H3</div>
									<h3 class="heading-style-h3">This is Heading style H3.</h3>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H4</div>
									<h4 class="heading-style-h4">This is Heading style H4.</h4>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H5</div>
									<h5 class="heading-style-h5">This is Heading style H5.</h5>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Heading Style H6</div>
									<h2 class="heading-style-h6">This is Heading style H6.</h2>
								</div>
							</div>
						</div>
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Typography</h2>
								<h3>Text Sizes</h3>
								<p>
									Use these text classes when the visual typography style you
									want doesn&#x27;t match the default HTML tag.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="_3-column-grid">
									<div class="style-guide-item">
										<div class="style-guide-label">Text Size Large</div>
										<p class="text-size-large">
											This is a paragraph with text size large.<br>
										</p>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Size Medium</div>
										<p class="text-size-medium">
											This is a paragraph with text size medium.<br>
										</p>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Size Regular</div>
										<p class="text-size-regular">
											This is a paragraph with text size regular.<br>
										</p>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Size Small</div>
										<p class="text-size-small">
											This is a paragraph with text size small.<br>
										</p>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Size Tiny</div>
										<p class="text-size-tiny">
											This is a paragraph with text size tiny.<br>
										</p>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Accent</div>
										<div class="accent">Features</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Colors" class="section-style-guide-colors">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Color Palette</h2>
								<h3>Background Color</h3>
								<p>
									These colors have been created using Variables. If you edit the
									Variable color, it will change every element that uses that
									color Variable.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">Black #00000</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21351ea-4f5c4829"
										class="style-guide-color background-black">
										<div class="background-black"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">White #ffffff</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21351f4-4f5c4829"
										class="style-guide-color background-white">
										<div class="background-white"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Light Gray #F6F6F6</div>
									<div id="w-node-_0e5da242-9771-9c0d-4f8e-5225fc0da855-4f5c4829"
										class="style-guide-color background-light-gray">
										<div class="background-light-gray"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Medium Gray  #E5E5E5</div>
									<div id="w-node-_8ef19c44-af2a-3275-10a3-2708a6ef8edf-4f5c4829"
										class="style-guide-color background-medium-gray">
										<div class="background-medium-gray"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Dark Gray #AAAAAA</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21351ef-4f5c4829"
										class="style-guide-color background-dark-gray">
										<div class="background-dark-gray"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Color Palette</h2>
								<h3>Text Color</h3>
								<p>
									These colors have been created using Variables. If you edit the
									Variable color, it will change every element that uses that
									color Variable.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="_3-column-grid">
									<div class="style-guide-item">
										<div class="style-guide-label">Text Color Black</div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135204-4f5c4829"
											class="text-color-black">Text Color Black</div>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Color Dark Gray</div>
										<div class="text-color-dark-gray">Text Color Dark Gray</div>
									</div>
									<div class="style-guide-item">
										<div class="style-guide-label">Text Color White</div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213520e-4f5c4829"
											class="background-black">
											<div
												id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213520f-4f5c4829"
												class="text-color-white">Text Color White</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Buttons" class="section-style-guide-buttons">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Buttons</h2>
							</div>
							<div class="_3-column-grid">
								<div class="style-guide-item">
									<div class="style-guide-label">Button Primary Small</div>
									<a id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213521c-4f5c4829"
										href="#" class="button-primary-small w-button">Button Text</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Primary Regular</div>
									<a id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135221-4f5c4829"
										href="#" class="button-primary-regular w-button">Button
										Text</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Primary Large</div>
									<a href="#" class="button-primary-large w-button">Button
										Text</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Text Only</div>
									<a href="#" class="button-text-only w-button">Button Text</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Full Width</div>
									<a href="#" class="button-full-width w-button">Button Text</a>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Icon</div>
									<a id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135253-4f5c4829"
										href="#" class="button-icon w-inline-block"><img
										src="../images/ph_arrow-up-right-light-xxsmall-dark-gray.svg"
										loading="lazy" alt="" class="icon-height-xxsmall"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Icons" class="section-style-guide-icons">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Icons</h2>
								<p>
									Uniform icons sizes used throughout the template.<br>
								</p>
							</div>
							<div class="_2-column-grid">
								<div class="style-guide-item">
									<div class="style-guide-label">Icon 1x1 XXSmall</div>
									<img
										src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg"
										loading="lazy" alt="" class="icon-1x1-xxsmall">
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Icon 1x1 XSmall</div>
									<img
										src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg"
										loading="lazy" alt="" class="icon-1x1-xsmall">
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Icon 1x1 Small</div>
									<img
										src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg"
										loading="lazy" alt="" class="icon-1x1-small">
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Icon 1x1 Medium</div>
									<img
										src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg"
										loading="lazy" alt="" class="icon-1x1-medium">
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Icon 1x1 Large</div>
									<img
										src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg"
										loading="lazy" alt="" class="icon-1x1-large">
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Forms" class="section-style-guide-forms">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Forms</h2>
							</div>
							<div class="style-guide-item">
								<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135292-4f5c4829"
									class="style-guide-label">Form Component</div>
								<div id="Style-Guide-Form" class="form-component w-form">
									<form name="wf-form-Style-Guide-Form"
										data-name="Style Guide Form" method="get" id="email-form"
										class="form" data-wf-page-id="6684f0fb2a5375354f5c4829"
										data-wf-element-id="53136190-a09f-21c5-1bcd-4ebdd2135295">
										<div class="form-field-wrapper">
											<label for="Style-Guide-Form-First-Name"
												class="form-field-label">Text Input</label><input
												class="form-field w-input" maxlength="256" name="First-Name"
												data-name="First Name" placeholder="First Name" type="text"
												id="Style-Guide-Form-First-Name">
										</div>
										<div class="form-field-wrapper">
											<label for="Style-Guide-Form-Message"
												class="form-field-label">Text Area</label>
											<textarea id="Style-Guide-Form-Message" name="Message"
												maxlength="5000" data-name="Message" placeholder="Message"
												class="form-field text-area w-input"></textarea>
										</div>
										<div class="form-field-wrapper">
											<label for="Style-Guide-Form-Style-Select"
												class="form-field-label">Select field</label><select
												id="Style-Guide-Form-Style-Select" name="Style-Select"
												data-name="Style Select"
												class="form-field is-select-input w-select">
												<option value="">Select one...</option>
												<option value="First">First Choice</option>
												<option value="Second">Second Choice</option>
												<option value="Third">Third Choice</option>
											</select>
										</div>
										<div class="form-field-wrapper">
											<label for="email" class="form-field-label">Checkbox
												field</label><label class="w-checkbox form-checkbox">
												<div
													class="w-checkbox-input w-checkbox-input--inputType-custom form-checkbox-icon w--redirected-checked"></div>
												<input id="Checkbox" type="checkbox" name="Checkbox"
												data-name="Checkbox"
												style="opacity: 0; position: absolute; z-index: -1"
												checked=""><span for="Checkbox"
												class="text-size-regular w-form-label">Checkbox</span>
											</label>
										</div>
										<div class="form-field-wrapper">
											<label for="email" class="form-field-label">Radio
												button</label><label class="form-radio-button w-radio"><input
												id="Style-Guide-Form-Radio" type="radio" name="Radio"
												data-name="Radio"
												class="w-form-formradioinput form-radio-icon w-radio-input"
												value="Radio"><span
												class="text-size-regular w-form-label"
												for="Style-Guide-Form-Radio">Radio</span></label>
										</div>
										<input type="submit" data-wait="Please wait..."
											class="button-primary-large w-button" value="Submit">
									</form>
									<div class="form-success-message w-form-done">
										<div>Thank you! Your submission has been received!</div>
									</div>
									<div class="form-error-message w-form-fail">
										<div>Oops! Something went wrong while submitting the
											form.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Structure" class="section-style-guide-structure">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Structure</h2>
								<h3>Structure</h3>
								<p>
									Core structure classes used throughout the template.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">Page Wrapper</div>
									<div class="page-wrapper">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Main Wrapper</div>
									<main class="main-wrapper">
										<div class="style-guide-empty-box"></div>
									</main>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352cf-4f5c4829"
										class="style-guide-label">Container - Small</div>
									<div class="container-small">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352d4-4f5c4829"
										class="style-guide-label">Container Medium</div>
									<div class="container-medium">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352d9-4f5c4829"
										class="style-guide-label">Container Large</div>
									<div class="container-large">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_0e071321-0672-129d-92b4-c33318109565-4f5c4829"
										class="style-guide-label">Container Full Width</div>
									<div class="container-full-width">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352de-4f5c4829"
										class="style-guide-label">Padding Global</div>
									<div class="padding-global">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item is-stretch">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352e3-4f5c4829"
										class="style-guide-label">Padding Section Small</div>
									<div class="padding-section-small">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item is-stretch">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352e8-4f5c4829"
										class="style-guide-label">Padding Section Medium</div>
									<div class="padding-section-medium">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item is-stretch">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21352ed-4f5c4829"
										class="style-guide-label">Padding Section Large</div>
									<div class="padding-section-large">
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Button Group</div>
									<div class="button-group">
										<div class="style-guide-empty-box"></div>
										<div class="style-guide-empty-box"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="Layout" class="section-style-guide-layout">
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Layout</h2>
								<p>
									Multi-column layouts used throughout the template.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">2 Column Grid</div>
									<div class="_2-column-grid">
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135469-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213546a-4f5c4829"
											class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">2 Column Grid Uneven Right</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213546e-4f5c4829"
										class="_2-column-grid-uneven-right">
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213546f-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135470-4f5c4829"
											class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">2 Column Grid Uneven Left</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135474-4f5c4829"
										class="_2-column-grid-uneven-left">
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135475-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135476-4f5c4829"
											class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">3 Column Grid</div>
									<div class="_3-column-grid">
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213547b-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213547c-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213547d-4f5c4829"
											class="style-guide-empty-box"></div>
									</div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">4 Column Grid</div>
									<div class="_4-column-grid">
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135482-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135483-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135484-4f5c4829"
											class="style-guide-empty-box"></div>
										<div
											id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135485-4f5c4829"
											class="style-guide-empty-box"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="padding-section-medium style-guide">
					<div class="padding-global">
						<div class="container-large style-guide-columns">
							<div class="style-guide-titles">
								<h2>Spacers</h2>
								<p>
									Uniform spacer sizes used throughout the template.<br>
								</p>
							</div>
							<div class="style-guide-assets">
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XXXSmall</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135493-4f5c4829"
										class="spacer-xxxsmall background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XXSmall</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd2135497-4f5c4829"
										class="spacer-xxsmall background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XSmall</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213549b-4f5c4829"
										class="spacer-xsmall background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer Small</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd213549f-4f5c4829"
										class="spacer-small background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer Medium</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354a3-4f5c4829"
										class="spacer-medium background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354a5-4f5c4829"
										class="style-guide-label">Spacer Large</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354a7-4f5c4829"
										class="spacer-large background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XLarge</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354ab-4f5c4829"
										class="spacer-xlarge background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XXLarge</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354af-4f5c4829"
										class="spacer-xxlarge background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XXXLarge</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354b3-4f5c4829"
										class="spacer-xxxlarge background-gray"></div>
								</div>
								<div class="style-guide-item">
									<div class="style-guide-label">Spacer XXXXLarge</div>
									<div id="w-node-_53136190-a09f-21c5-1bcd-4ebdd21354b7-4f5c4829"
										class="spacer-xxxxlarge background-gray"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		<div class="section-newsletter">
			<div class="padding-global">
				<div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd"
					class="container-newsletter background-black">
					<div class="_2-column-grid-uneven-left">
						<h3 class="newsletter-heading">Love what you see? Sign up for
							my newsletter and stay in touch.</h3>
						<div id="Style-Guide-Form"
							class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
							<form name="wf-form-Newsletter-Form" data-name="Newsletter Form"
								method="get" id="wf-form-Newsletter-Form"
								class="newsletter-form"
								data-wf-page-id="6684f0fb2a5375354f5c4829"
								data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
								<input class="form-field newsletter w-input" maxlength="256"
									name="Email" data-name="Email" placeholder="Your email address"
									type="email" id="Email" required=""><input
									type="submit" data-wait="Please wait..."
									class="button-primary-large max-width-full-mobile-portrait w-button"
									value="Join">
							</form>
							<div class="form-success-message w-form-done">
								<div class="text-size-regular text-color-white">Thank you!
									Your submission has been received!</div>
							</div>
							<div class="form-error-message w-form-fail">
								<div class="text-size-regular">Oops! Something went wrong
									while submitting the form.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section-footer">
			<div class="padding-global">
				<div class="spacer-xxlarge"></div>
				<div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe"
					class="container-footer">
					<div class="padding-global">
						<div class="padding-section-medium">
							<div class="_2-column-grid">
								<a href="../index.html" class="w-inline-block"><img
									src="../images/ph_globe-simple-light-medium.svg" loading="lazy"
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
										<a href="../about.html" class="footer-link">About</a> <a
											href="../contact.html" class="footer-link">Contact</a>
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
										<a href="../template/template-style-guide.html"
											aria-current="page" class="footer-link w--current">Style
											Guide</a> <a href="../template/changelog.html"
											class="footer-link">Changelog</a> <a
											href="../template/licenses.html" class="footer-link">Licenses</a>
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
	</div>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>