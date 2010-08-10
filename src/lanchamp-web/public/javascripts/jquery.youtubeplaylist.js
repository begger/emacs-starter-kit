//-------------------------------------------------
//		youtube playlist jquery plugin
//		Created by dan@geckonm.com
//		www.geckonewmedia.com
//-------------------------------------------------

jQuery.fn.ytplaylist = function(options) {
 
  // default settings
  var options = jQuery.extend( {
    holderId: 'ytvideo',
	playerHeight: '385',
	playerWidth: '640',
	addThumbs: false,
	thumbSize: 'small',
	showInline: false,
	autoPlay: true,
	showRelated: true
  },options);
 
  return this.each(function() {
							
   		var selector = jQuery(this);
		
		var autoPlay = "";
		var showRelated = "&rel=0";
		if(options.autoPlay) autoPlay = "&autoplay=1"; 
		if(options.showRelated) showRelated = "&rel=1"; 
		
		//throw a youtube player in
		function play(id)
		{
		   var html  = "<div id='loading'></div>";
	
		   html += '<object height="'+options.playerHeight+'" width="'+options.playerWidth+'">';
		   html += '<param name="movie" value="http://www.youtube.com/v/'+id+autoPlay+showRelated+'&amp;hl=en_US&amp;fs=1?color1=0x000000&amp;color2=0x000000"></param>';
		   html += '<param name="wmode" value="transparent"></param>';
		   html += '<embed src="http://www.youtube.com/v/'+id+autoPlay+showRelated+'&amp;hl=en_US&amp;fs=1?color1=0x000000&amp;color2=0x000000" type="application/x-shockwave-flash" wmode="transparent"  height="'+options.playerHeight+'" width="'+options.playerWidth+'"></embed>';
		   html += '</object>';
	
		   return html;
		};
		
		//grab a youtube id from a (clean, no querystring) url (thanks to http://jquery-howto.blogspot.com/2009/05/jyoutube-jquery-youtube-thumbnail.html)
		function youtubeid(url) {
			var ytid = url.match("[\\?&]v=([^&#]*)");
			ytid = ytid[1];
			return ytid;
		};
		
		
		//load inital video
		var firstVid = selector.children("li:first-child").addClass("currentvideo").children("a").attr("href");
		jQuery("#"+options.holderId+"").html(play(youtubeid(firstVid)));
		jQuery('#loading').hide();
		
		//load video on request
		selector.children("li").children("a").click(function() {
			jQuery('#loading').show();	
			if(options.showInline) {
				jQuery("li.currentvideo").removeClass("currentvideo");
				jQuery(this).parent("li").addClass("currentvideo").html(play(youtubeid(jQuery(this).attr("href"))));
			}
			else {
				jQuery("#"+options.holderId+"").html(play(youtubeid(jQuery(this).attr("href"))));
				jQuery(this).parent().parent("ul").find("li.currentvideo").removeClass("currentvideo");
				jQuery(this).parent("li").addClass("currentvideo");
				jQuery('#loading').hide();
			}
													 
			
			
			return false;
		});
		
		//do we want thumns with that?
		if(options.addThumbs) {
			
			selector.children().each(function(i){
											  
				var replacedText = jQuery(this).text();
				
				if(options.thumbSize == 'small') {
					var thumbUrl = "http://img.youtube.com/vi/"+youtubeid(jQuery(this).children("a").attr("href"))+"/2.jpg";
				}
				else {
					var thumbUrl = "http://img.youtube.com/vi/"+youtubeid(jQuery(this).children("a").attr("href"))+"/0.jpg";
				}
				
				
				jQuery(this).children("a").empty().html("<img src='"+thumbUrl+"' alt='"+replacedText+"' /><span>"+replacedText + "</span>").attr("title", replacedText);
				
			});	
			
		}
			
		
   
  });
 
};

