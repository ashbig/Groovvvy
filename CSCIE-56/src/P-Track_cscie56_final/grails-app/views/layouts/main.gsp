<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="bootstrap.css"/>
		<asset:javascript src="bootstrap.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div class ="container" id="logo" role="banner" align="center"><a href="/P-Track_cscie56_final/freezer/index.gsp"><asset:image src="PlasmID_logo.jpg" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
        <div class="modal-footer" align="center" style="background-color: #ffffff">
            <p class="muted credit"></p>
            <p class="muted credit"> Freezer-Tracking Site: P-Track © 2014</p>
            <p class="muted credit"> Cscie E-56: Final Project</p>
            <p class="muted credit"> Ashkan Bigdeli</p>

        </div>
</body>

</html>
