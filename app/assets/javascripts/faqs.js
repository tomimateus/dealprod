$(document).ready(function() {

	//accordion
	$(".accordion .accord-tab").eq().addClass("active"); //eq(0) abre la primer tab
	$(".accordion .accord_cont").eq().show();

	$(".accordion .accord-tab").click(function(){
		$(this).next(".accord_cont").slideToggle("fast")
		.siblings(".accord_cont:visible").slideUp("fast");
		$(this).toggleClass("active");
		$(this).siblings(".accord-tab").removeClass("active");
	});	

		
});	
