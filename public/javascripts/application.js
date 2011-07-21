$(function() {
	$("#click_me").live("click", function() {
		alert("The row did not go into edit mode!");
		return false;
	});
	
	$(".col_tr").live("click", function(e) {
			var page = $("#page").val();			
			var $target = $(e.target);
			if( $target.is("div") ) {
				$.getScript('/posts/' + this.id + '/edit?page=' + page);
				return false;
			}
	});
	
	$("#posts_list .pagination a").live("click", function() {
		$.getScript(this.href);
		var page_num = getParameterByName('page', this.href);
		if(page_num != 1) {
			$("#post_form").fadeOut('slow');
		} else {
			$("#post_form").fadeIn('fast');
		}
		updatePageField(page_num);
		return false;
	});
	
	function updatePageField(page) {
		$("#page").val(page);
		return;
	}
});

function getParameterByName(name, href) {
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(href);
  if(results == null)
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}
