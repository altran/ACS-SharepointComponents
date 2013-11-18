<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>
<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
	<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../Scripts/doT.min.js"></script>
	<script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
	<script type="text/javascript" src="/_layouts/15/sp.js"></script>

	<!-- Add your CSS styles to the following file -->
	<link rel="Stylesheet" type="text/css" href="../Content/App.css" />

	<!-- Add your JavaScript to the following file -->
	
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
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
	Altran CV Search
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
	<input type="text" id="inputq">
	<div id="message">
		Search for people.
	</div>
	<script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>