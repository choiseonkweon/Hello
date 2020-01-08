$(document).ready(function() {
	UI = {
		init      : function() {
			UI.matchMedia();
			UI.activeGnb();
			UI.bindUIactions();
		},
		activeGnb : function() {
			if ($('body').hasClass('pc') || $('body').hasClass('tablet')) {
				$('#gnb').on('mouseenter', function() {
					$('#gnbWrapper').addClass('activeGnbWrapper');
					$('#gnbWrap').addClass('activeGnb');
				});
				$('#gnbWrap').on('mouseleave', function() {
					$('#gnbWrapper').removeClass('activeGnbWrapper');
					$(this).removeClass('activeGnb');
				});
				$('.loginInfo').on('mouseenter', function() {
					$('#gnbWrapper').removeClass('activeGnbWrapper');
					$('#gnbWrap').removeClass('activeGnb');
				});
			} else {
				$('#gnb, .loginInfo').off('mouseenter');
				$('#gnbWrap').off('mouseleave');
			}
		},
		matchMedia: function() {
			if(window.matchMedia("(min-width:1110px)").matches) {
				$('body').removeClass('tablet mobile').addClass('pc');
			} else if (window.matchMedia("(min-width:768px").matches) {
				$('body').removeClass('pc mobile').addClass('tablet');
			} else {
				$('body').removeClass('pc tablet').addClass('mobile');
				console.log('mobile');
			}
		},
		// Set Button Burger Menu
		el: {
			ham: $('.btnBurgerMenu'),
			menuTop: $('.menu-top'),
			menuMiddle: $('.menu-middle'),
			menuBottom: $('.menu-bottom')
		},
		bindUIactions: function() {
			UI.el.ham
				.on(
					'click',
					function(event) {
						UI.activateMenu(event);
						event.preventDefault();
					}
				);
		},
		activateMenu: function() {
			var layerGnb = $('#gnb');
			UI.el.ham.toggleClass('active');
			UI.el.menuTop.toggleClass('menu-top-click');
			UI.el.menuMiddle.toggleClass('menu-middle-click');
			UI.el.menuBottom.toggleClass('menu-bottom-click');

			if (UI.el.ham.hasClass('active')) {
				layerGnb.animate({
					left : 0
				}, 300);
				UI.activeMobileGnb();
			} else {
				layerGnb.animate({
					left : '100vw'
				}, 300);

			}
		},
		// Set Mobile Mode Gnb Action
		activeMobileGnb : function() {
			$('#gnb .depth1 > li > a').on('click', function() {
				$('#gnb .depth1 > li > a').removeClass('on');
				$(this).toggleClass('on');

				if ($(this).hasClass('on')) {
					$('#gnb .depth2').hide();
					$('#gnb .depth1').addClass('activeSubMenu');
					$('#gnb .depth1 > li').css('height', '40px');
					$(this).parent().css('height' , 'auto');
					$(this).next().toggle();
				} else {
					$(this).next().toggle();
					$('#gnb .depth1').removeClass('activeSubMenu');
					$(this).parent().css('height' , '40px');
				}
			});
		}
	}

	UI.init();
});

// window Resize�� body �붿냼�� class 異붽��쒕떎.
$(window).on('resize', function() {
	UI.matchMedia();
	UI.activeGnb();

	$('#gnbWrapper').removeClass('activeGnbWrapper');
	$('#gnbWrap').removeClass('activeGnb');
});


  $(function(){
    //팝업
    $('.popPrivacyBtn').on('click',function(e){
      e.preventDefault();
      $('.popPrivacy').show(0);
      $('body').bind('touchmove', function(e){e.preventDefault()});
    });
    $('.pop_bg, .btn_close, .btnCloseText').on('click',function(){
      $('.popPrivacy').hide(0);
      $('body').unbind('touchmove');
    });

    //팝업
    $('.popEmailBtn').on('click',function(e){
      e.preventDefault();
      $('.popEmail').show(0);
      $('body').bind('touchmove', function(e){e.preventDefault()});
    });
    $('.pop_bg, .btn_close, .btnCloseText').on('click',function(){
      $('.popEmail').hide(0);
      $('body').unbind('touchmove');
    });

		//관련기관 웹사이트
		$('.footer_site button').on('click',function(){
			$('.footer_site ul').slideToggle(300);
		});
  });
