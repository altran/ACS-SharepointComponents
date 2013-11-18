'use strict';

var context = SP.ClientContext.get_current();
var user = context.get_web().get_currentUser();

(function () {
	
	$('#inputq').keyup(function(){
		var v = $(this).val() || '*';
		search(v);
	});
	
	function search(q){
		$.ajax({
		  url: 'https://cv.altran.no/solr/collection1/select',
		  data: {'wt':'json', 'q':q},
		  success: function(data) { 
			  renderResults(data);
		  },
		  dataType: 'jsonp',
		  jsonp: 'json.wrf'
		});
	}
	
	function renderResults(data) {
		var html = "";
		if(data.response.numFound > 0){
			var ppl = data.response.docs;
			for(var i=0, ppllength = ppl.length;i<ppllength;i++) {
				var person = $.parseJSON( data.response.docs[i].rendered );
				person.image = person.image.replace(/(.jpg|.png)/gi,'_scale_110x110.jpg');
				html += renderer(person);
			}
		} else {
			html = "No people found for search " + data.responseHeader.params.q;
		}
		$('#message').html(html);
	}
	
	var template = $('#persontemplate').text().replace('XXXcvidXXX','<%=cv.id%>').replace('XXXpidXXX','<%=p.id%>').replace('999999','<%=cv.id%>');
	var renderer = doT.template(template);
	
	search('*');

})();