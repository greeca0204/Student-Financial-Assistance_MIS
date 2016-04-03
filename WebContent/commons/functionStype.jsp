<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<script type="text/javascript">
<!--//---------------------------------+
	//  Developed by Roshan Bhattarai 
	//  Visit http://roshanbh.com.np for this script and more.
	//  This notice MUST stay intact for legal use
	// --------------------------------->
	$(document).ready(
			function() {
				//slides the element with class "menu_body" when paragraph with class "menu_head" is clicked 
				$("#functionpane p.menu_head").click(
						function() {
							$(this).css({
								backgroundImage : "url(images/down.png)"
							}).next("div.menu_body").slideToggle(300).siblings(
									"div.menu_body").slideUp("slow");
							$(this).siblings().css({
								backgroundImage : "url(images/left.png)"
							});
						});
				/* //slides the element with class "menu_body" when mouse is over the paragraph
				$("#functionpane p.menu_head").mouseover(
						function() {
							$(this).css({
								backgroundImage : "url(images/down.png)"
							}).next("div.menu_body").slideDown(500).siblings(
									"div.menu_body").slideUp("slow");
							$(this).siblings().css({
								backgroundImage : "url(images/left.png)"
							});
						}); */
			});
</script>
<style type="text/css">
.menu_list {
	width: 200px;
}
.menu_head {
	height: 30px;
	cursor: pointer;
	position: relative;
	margin: 2px;
	font-weight: bold;
	background: #eef4d3 url(images/left.png) center right no-repeat;
}

.menu_body {
	display: none;
}

.menu_body a {
	display: block;
	color: #006699;
	background-color: #EFEFEF;
	padding-left: 10px;
	font-weight: bold;
	text-decoration: none;
	height: 30px;
}

.menu_body a:hover {
	color: #000000;
	text-decoration: underline;
}
</style>