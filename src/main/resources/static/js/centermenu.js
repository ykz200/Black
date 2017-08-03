(function($){
	//动态加载animate
	var loadStyles = function(url) {
		var hasSameStyle = false;
		var links = $('link');
		for(var i = 0;i<links.length;i++){
			if(links.eq(i).attr('href') == url){
				hasSameStyle = true;
				return
			}
		}

		if(!hasSameStyle){
			var link = document.createElement("link");
			link.type = "text/css";
			link.rel = "stylesheet";
			link.href = url;
			document.getElementsByTagName("head")[0].appendChild(link);
		}
    }

    // loadStyles('http://www.daiwei.org/global/css/animate.css');

	var showMask = function(options) {
    	var _this = this;
    	var defaultvalue = {
    		background: 			'rgba(0,0,0,0.6)',			//背景色
    		zIndex: 				'1000',						//层级
    		animateStyle: 			'fadeIn',					//进入动画
    		clickClose: 			true, 						//是否可以点击关闭
    		duration: 				500, 						//动画的过渡时间
    		closeAnimate:function(){}, 							//关闭浮层 的回调   也可以写其他元素的关闭动画 
    	};

    	var showMaskEle = '';

    	var opt = $.extend(defaultvalue , options || {});


    	defaultvalue._init = function(){
    		//存在有mask则不会再调用mask
    		if ($('.cpt-dw-mask').length) {return}

    		showMaskEle = $('<div class="cpt-dw-mask animated '+opt.animateStyle+'"></div>').css({
    			background:opt.background,
    			'z-index':opt.zIndex,
    			'webkit-transition':'all '+opt.duration/1000+'s',
				'-moz-transition':'all '+opt.duration/1000+'s',
				transition:'all '+opt.duration/1000+'s',
				'-webkit-animation-duration':opt.duration/1000+'s',
    			'-moz-animation-duration':opt.duration/1000+'s',
    			'animation-duration':opt.duration/1000+'s',
    		}).appendTo($('body'));
    		defaultvalue._showScroll(false);
    		defaultvalue._event();
    	};

    	defaultvalue._showScroll = function(isShow){
    		var eleHeight = window.screen.availHeight ;			//浏览器可以工作的区域高度
    		var bodyHeight = document.body.clientHeight || document.documentElement.clientHeight;		//网页的实际高度
    		if(bodyHeight > eleHeight) {
    			var isshow = isshow || 'false';
	    		if(isShow){
	    			$('body,html').css({height:'auto',overflow:'auto'});

	    			$(document.body).css({
	    				'border-right':'none',
	    			})
	    		}else{
	    			var scrollWidth = defaultvalue._getScrollWidth();
	    			$('body,html').css({height:'100%',overflow:'hidden'});
	    			$('body').css({
	    				'border-right':scrollWidth+'px solid transparent',
	    			})
	    		}
    		} else {
    			return
    		}
    	};

    	defaultvalue._getScrollWidth = function(){
		    var noScroll, scroll, oDiv = document.createElement('div');
		    oDiv.style.cssText = 'position:absolute; top:-1000px;     width:100px; height:100px; overflow:hidden;';
		    noScroll = document.body.appendChild(oDiv).clientWidth;
		    oDiv.style.overflowY = 'scroll';
		    scroll = oDiv.clientWidth;
		    document.body.removeChild(oDiv);
		    return noScroll-scroll;   
    	}

    	defaultvalue._removeMask = function(){
            if(!isLowerIe9()){
                showMaskEle.addClass("fadeOut").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
        			showMaskEle.remove();
        		});
            }else{
                showMaskEle.remove();
            }

            opt.closeAnimate();
    	};

    	defaultvalue._event = function(){
    		showMaskEle.on('click',function(){
                if(opt.clickClose){
    				defaultvalue._showScroll(true);
                    defaultvalue._removeMask();
                }
    		})
    	};

    	defaultvalue._init();
    };

    var isLowerIe9 = function(){
        return (!window.FormData);
    };

	$.fn.centermenu = function(options){
		var $this = $(this);
		var _this = this;
		return this.each(function(){
			var defaultSelectMenu = {
	    		liWidth: 			260, 		//列表的宽度
	    		zIndex: 			10001,		//层级
	    		liHeight: 			40,			//
	    		background: 		'#ffffff', 	//背景色
	    		animateIn: 			'fadeIn', 	//进入动画效果
	    		animateOut: 		'fadeOut', 	//离开动画效果
	    		hasLineBorder:		true, 		//是否有一像素的分割线
	    		duration: 			300, 		//动画时间   300毫秒
	    		source: 			['select1','select2','select3','select4'], 		//选择按钮的内容
	    		click:function(ret){},	//点击之后的方法	
	    	}

	    	var opt = $.extend(defaultSelectMenu, options||{});
	    	var length = opt.source.length;

	    	defaultSelectMenu._init = function(){
	    		if($('body').find('.cpt-selectCenterMenu').length){
		    		return;
		    	};

		    	//获取ul的高度  (li的高度*source的length+1)
		    	var ul_height = opt.liHeight * (opt.source.length);

	    		_this.cpt_selectCenterMenu = $('<ul class="animated '+opt.animateIn+' cpt-selectCenterMenu ul-selectCenterMenu"></ul>').css({
	    			width:opt.liWidth,
	    			height:'auto',
	    			background:opt.background,
	    			'z-index':opt.zIndex,
	    			'webkit-transition':'all '+opt.duration/1000+'s',
					'-moz-transition':'all '+opt.duration/1000+'s',
					transition:'all '+opt.duration/1000+'s',
					'-webkit-animation-duration':opt.duration/1000+'s',
	    			'-moz-animation-duration':opt.duration/1000+'s',
	    			'animation-duration':opt.duration/1000+'s',
	    			'-webkit-transform':'translate(-50%,-50%)',
	    			'-moz-transform':'translate(-50%,-50%)',
	    			'transform':'translate(-50%,-50%)',
	    		}).appendTo($this);

	    		if(opt.hasLineBorder){
	    			for(var i = 0;i < length;i++){
		    			_this.li_selectCenterMenu = $('<li class="li-selectCenterMenu border-1px">'+opt.source[i]+'</li>').css({
		    				width:opt.liWidth,
		    				height:opt.liHeight,
		    				'line-height':opt.liHeight+'px',
		    			}).appendTo(_this.cpt_selectCenterMenu);
		    		}
	    		}else{
	    			for(var i = 0;i < length;i++){
		    			_this.li_selectCenterMenu = $('<li class="li-selectCenterMenu">'+opt.source[i]+'</li>').css({
		    				width:opt.liWidth,
		    				height:opt.liHeight,
		    				'line-height':opt.liHeight+'px',
		    			}).appendTo(_this.cpt_selectCenterMenu);
		    		}
	    		};

	    		defaultSelectMenu._clickMaskToClose();
	    		defaultSelectMenu._clickEvent();
	    	},

	    	defaultSelectMenu._clickEvent = function(){
	    		_this.cpt_selectCenterMenu.find('.li-selectCenterMenu').on('click',function(event){
					var index = $(this).index();	
		    		var ret = {
		    			ele:$(this),
		    			index:index,
		    			text:$(this).text(),
		    		}

		    		opt.click(ret);

		    		if(!isLowerIe9()){
		    			_this.cpt_selectCenterMenu.addClass(opt.animateOut).on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
				    		_this.cpt_selectCenterMenu.remove();
			    		});

			    		$('.cpt-dw-mask').addClass("fadeOut").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
			    			$('.cpt-dw-mask').remove();
			    		});
		    		}else{
		    			_this.cpt_selectCenterMenu.remove();
		    			$('.cpt-dw-mask').remove();
		    		}

		    		$('body,html').css({height:'auto',overflow:'auto'});

	    			$(document.body).css({
	    				'border-right':'none',
	    			});
				});
	    	};

	    	defaultSelectMenu._clickMaskToClose = function(){
				showMask({
					duration:opt.duration,
					zIndex:opt.zIndex - 1, 
		    		closeAnimate: function(){
			    		if(!isLowerIe9()){
			                _this.cpt_selectCenterMenu.addClass(opt.animateOut).on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
				    			_this.cpt_selectCenterMenu.remove();
				    		});
			            }else{
			                _this.cpt_selectCenterMenu.remove();
			            }
		    		},
		    	});
			};
			defaultSelectMenu._init();
		});
	}
})(jQuery);