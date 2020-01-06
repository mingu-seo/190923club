
     $(function(){
    	 $('.depth1>li').on('mouseenter', function(){
    		$(this).find('.depth2').stop().slideDown(300);	 
    	 }).on('mouseleave', function(){
    		 $(this).find('.depth2').stop().slideUp(300);
    	 })
     });

    $(function(){
        var swiper = new Swiper('.swiper', {
            slidesPreView:'auto',
            loop:true,
            navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
         
            pagination: {
            el: '.swiper-pagination',
             },
         });
  
       		 //팝업 화면 가운데 위치시키기
       		 var popTop =($(window).height()-$('.divPop').outerHeight())/2 + $(window).scrollTop();
			 var popLeft =($(window).width()-$('.divPop').outerWidth())/2 + $(window).scrollLeft();
			 $('.divPop').css({
				 'top' : popTop+'px',
				 'left' : popLeft+'px'
			 })
			 
			
			 $('.divPop').draggable();
			 
			 $('.divPop>div').click(function(){
				 $(".divPop").hide();
			 });
	    			
	    		
		
			 
			 var banner= new Swiper('.banner-swiper', {
				 slidesPerView : 5,
				 slidesPerGroup : 1,
				 spaceBetween: 20,
				 loop:true,
			 	 autoplay:{
			 		 delay : 1000,
			 		 disableOnInteraction : false
			 	 }
			 });
        
    		var quick_left=$(".menu > ul:first-child").position().left+1200;
    		$('.quickMenu').css({
    			top:108,
    			left:quick_left
    		})
			 
			 
			
			 $(window).resize(function(){
				 var quick_left=$(".menu > ul:first-child").position().left+1200;
	    		$('.quickMenu').stop().animate({
	    			'left':quick_left+'px'
	    		},500);
	    		})
	    			
	    			
	    		
    		
    		$(window).scroll(function(){
    			var top=$(window).scrollTop();
    			$('.quickMenu').stop().animate({
    			'top':top+108+'px'
    		},500);
    		})
    		
    		$('.goTop').click(function(){
    			$("html").animate({scrollTop:0}, 300);
    		})
    		
    		$('.board_title').click(function(){
    			console.log($(this).index('.board_title'));
    			var idx=$(this).index('.board_title');
    			$('.board_title').removeClass('on');
    			$(this).addClass('on');
    			if(idx==0){
    				$("#board_notice").show();
    				$("#board_data").hide();
    				//$('.board_title').eq(0).addClass('on');
    				//$('.board_title').eq(1).removeClass('on');
    				
    			}else{
    				$("#board_notice").hide();
    				$("#board_data").show();
    				//$('.board_title').eq(0).removeClass('on');
    				//$('.board_title').eq(1).addClass('on');
    			}
    		})
    		
    		
    		$(".visual #slideClick").click(function() {
    		    $(".visual .visualLeft").animate({
    		        width: "toggle"
    		    }, 400, "linear");
    		});
    });
    
    		

        
    