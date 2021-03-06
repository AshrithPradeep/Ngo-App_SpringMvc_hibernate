<html>

<head>
<title>Access Denied</title>

<link
	href="${pageContext.request.contextPath}/resources/template/css/accessdenied.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<h1>403</h1>
	<div>
		<p>
			> <span>ERROR CODE</span>: "<i>HTTP 403 Forbidden</i>"
		</p>
		<p>
			> <span>ERROR DESCRIPTION</span>: "<i>Access Denied. You Do Not
				Have The Permission To Access This Page On This Server</i>"
		</p>
		<p>
			> <span>ERROR POSSIBLY CAUSED BY</span>: [<b>execute access
				forbidden, read access forbidden, write access forbidden, ssl
				required, ssl 128 required, ip address rejected, client certificate
				required, site access denied, too many users, invalid configuration,
				password change, mapper denied access, client certificate revoked,
				directory listing denied, client access licenses exceeded, client
				certificate is untrusted or invalid, client certificate has expired
				or is not yet valid, passport logon failed, source access denied,
				infinite depth is denied, too many requests from the same client ip</b>...]
		</p>


		<script
			src="${pageContext.request.contextPath}/resources/template/js/accessdenied.js"></script>
</body>

</html>