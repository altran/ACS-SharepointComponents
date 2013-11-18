<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>
<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" language="C#" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<!-- The following tells SharePoint to allow this page to be hosted in an IFrame -->
<WebPartPages:AllowFraming runat="server" />

<html>
	<head>
		<!-- The following scripts are needed when using the SharePoint object model -->
		<script type="text/javascript" src="/_layouts/15/MicrosoftAjax.js"></script>
		<script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
		<script type="text/javascript" src="/_layouts/15/sp.js"></script>
		<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../Scripts/doT.min.js"></script>

		<!-- Add your CSS styles to the following file -->
		<link rel="Stylesheet" type="text/css" href="../Content/App.css" />

	
		<script id="persontemplate" type="text/x-dot-template">
			<div class="card" id="p{{=it.id}}">
				{{?it.image}}<div style="background-image: url(https://cv.altran.no/media/{{=it.image}});" class="imgdiv"></div>{{?}}
				<h2>{{=it.name}}</h2>
				<h4>{{=it.title}}</h4>
				<p>{{=it.phone}} {{? it.country }} <img src="https://cv.altran.no/static/img/flags/{{=it.country}}.gif" width="16" height="11" alt="{{=it.country}}"/>{{?}}<br/>
					{{=it.mail}}</p>
				<p class="ldetail">Profile {{=it.completeness.percent}}% complete. Updated: {{=it.last_edited}}</p>
				{{? it.completeness.comment }}<ul class="ldetail">{{~it.completeness.comment :value:index}}<li>{{=value}}</li>{{~}}</ul>{{?}}
				<ul>
					{{~it.cv :cv:index}}
						{{? cv.status.percent > 10 }} 
							<li><a href="https://cv.altran.no/cv/{{=cv.id}}/">{{=cv.tags}} {{=cv.last_edited}} {{=cv.status.percent}}%</a></li>
						{{?}}
					{{~}}
				</ul>
			</div>
		</script> 
		
		<script type="text/javascript">
		    'use strict';

		    // Set the style of the client web part page to be consistent with the host web
		    (function () {
		        var hostUrl = '';
		        if (document.URL.indexOf('?') != -1) {
		            var params = document.URL.split('?')[1].split('&');
		            for (var i = 0; i < params.length; i++) {
		                var p = decodeURIComponent(params[i]);
		                if (/^SPHostUrl=/i.test(p)) {
		                    hostUrl = p.split('=')[1];
		                    document.write('<link rel="stylesheet" href="' + hostUrl + '/_layouts/15/defaultcss.ashx" />');
		                    break;
		                }
		            }
		        }
		        if (hostUrl == '') {
		            document.write('<link rel="stylesheet" href="/_layouts/15/1033/styles/themable/corev15.css" />');
		        }
		    })();
		</script>
	</head>

	<body>
			<input type="text" id="inputq">
			<div id="message">
				Search for people.
			</div>
		<script type="text/javascript" src="../Scripts/App.js"></script>
	</body>
</html>