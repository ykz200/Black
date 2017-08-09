$(function () {
  $('#elevator').backTop();

  $(window).scroll(function () {
    if ($(this).scrollTop() >= 300) {
      $('.header-top').addClass('header-top__fixed');
    } else {
      $('.header-top').removeClass('header-top__fixed');
    }
  });

  $('.nav-more').hoverDisplay('.nav-more__hover');
  $('#plus').hoverDisplay('#plus_popup');


  // 注册登录
  var $register_btn = $('#header').find('.register');
  var $login_btn = $('#header').find('.login');
  var $user = $('#user');
  var $user_inner = $user.find('.user-inner');
  var $user_register = $user.find('.register');
  var $user_login = $user.find('.login');
  var $close_btn = $user.find('.close');
  var $switch_login = $user.find('.switch-login').find('a');
  var $switch_register = $user.find('.go-register').find('a');

  var user_h = 0;
  var register_h = $user_register.height();
  var login_h = $user_login.height();

  $register_btn.click(function () {
    $user.fadeIn();
    $user_register.css({height: register_h}).show();
    $user_login.css({height: 0}).hide();

    user_h = $user_inner.height();

    $user_inner.css({marginTop: -(user_h / 2)});

    return false;
  });

  $login_btn.click(function () {
    $user.fadeIn();
    $user_register.css({height: 0}).hide();
    $user_login.css({height: login_h}).show();

    user_h = $user_inner.height();

    $user_inner.css({marginTop: -(user_h / 2)});

    return false;
  });

  $close_btn.click(function () {
    $user.fadeOut();
  });

  $(document).click(function () {
    $user.fadeOut();
  });

  $user_inner.click(function () {
    return false;
  });

  $switch_login.click(function () {
    $user_register.animate({height: 0}, function () {
      $(this).hide();
    });

    $user_login.show().animate({height: login_h});
  });

  $switch_register.click(function () {
    $user_login.animate({height: 0}, function () {
      $(this).hide();
    });

    $user_register.show().animate({height: register_h});
  });
});

!(function ($, window, document, undefined) {

  $.fn.backTop = function () {
    var $elem = this;
    var $doc = $(document.body);
    var client_h = $(window).height();

    $elem.click(function () {
      $doc.animate({scrollTop: 0});
    });

    $(window).on('scroll', function () {
      if ($(this).scrollTop() >= client_h) {
        $elem.show();
      } else {
        $elem.hide();
      }
    });
  }

  $.fn.hoverDisplay = function (hoverElem) {
    var $oParent = this;
    var $disELem = $(hoverElem);
    var timer = null;

    $oParent.hover(function () {
      clearTimeout(timer);

      $disELem.show();
    }, function () {
      timer = setTimeout(function () {
        $disELem.hide();
      }, 600);
    });

    $disELem.hover(function () {
      clearTimeout(timer);

      $disELem.show();
    }, function () {
      timer = setTimeout(function () {
        $disELem.hide();
      }, 600);
    });
  };

})(window.jQuery, window, document);