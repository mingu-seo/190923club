
     $(function(){
    	
    		
    		$(".visual #slideClick").click(function() {
    		    $(".visual .visualLeft").animate({
    		        width: "toggle"
    		    }, 400, "linear");
    		});
    		
    		/*$(".view-more").click(function() {
    			location.href="/club/project/gallaryList.do";
    		}); 더보기 클릭했을 때 스크립트*/
    		
    		
    });
    
    		
//관리자
     $(function(){
         $('.depth1 > li').on('mouseenter',function(){
         	$(this).find('.depth2').stop().slideDown(100);
         }).on('mouseleave',function(){
         	$(this).find('.depth2').stop().slideUp(100);
         });
         
         var swiper = new Swiper('.swiper', {
             slidesPerView: 'auto',
             loop: true,
         navigation: {
             nextEl: '.swiper-button-next',
             prevEl: '.swiper-button-prev',
         },
         pagination: {
             el: '.swiper-pagination',
         },
     	});
         
         //팝업 화면 가운데 위치 시키기
         var popTop = ($(window).height()-$('.divPop').outerHeight())/2 + $(window).scrollTop();
         var popLeft = ($(window).width()-$('.divPop').outerWidth())/2 + $(window).scrollLeft();
         $('.divPop').css({
         	'top' : popTop + 'px',
         	'left' : popLeft + 'px'
         });
         $(".divPop" ).draggable();
         
         $('.closeBtn').click(function(){
         	$('.divPop').hide();
         });
         var banner = new Swiper('.banner-swiper',{
         	slidesPerView : 5,
         	slidesGroup : 1,
         	spaceBetween : 20,
         	loop: true,
         	autoplay:{
         		delay : 1500,
         		disableOnInteracion : false
         	}
         });
         
         var quick_left = $(".menu > ul:first-child").position().left + 1200;
         $('.quickMenu').css({
         	top : 108,
         	left : quick_left
         });
         
         //퀵메뉴 스크롤 따라다니기
         $(window).scroll(function(){
         	var top = $(window).scrollTop();
         	$('.quickMenu').stop().animate({
         		'top' : top + 108 + 'px'
         	}, 200);
         });
         
     
         $(window).resize(function(){
         	$('.quickMenu').css({"left":($(".menu > ul:first-child").position().left + 1200)})
         });
         
                   	
         $('.goTop').click(function(){
         	$("html").animate({scrollTop:0},100)
         });
         $('.board_title').click(function(){
         	console.log($(this).index('.board_title'));
         	var idx = $(this).index('.board_title');
         	$('.board_title').removeClass('on');
         	$(this).addClass('on');
         	if( idx == 0 ){
         		$("#board_notice").show();
         		$("#board_data").hide();
         		//$(".board_title").eq(0).addClass('on')
         		//$(".board_title").eq(1).removeClass('on')
         	}else{
         		$("#board_notice").hide();
         		$("#board_data").show();
         		//$(".board_title").eq(1).addClass('on')
         		//$(".board_title").eq(0).removeClass('on')
         	}
         })
         $(".section").hover(function() {
         	$(this).addClass("Hover");
         },function() { 
         	$(this).removeClass("Hover"); 
         });
     
     });
        
    