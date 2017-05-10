////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// jQuery
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var $ = jQuery.noConflict();

$(document).ready(function($) {

    // Property page tabs
    $('.tabs .tab-links a').on('click', function(e)  {
        var currentAttrValue = $(this).attr('href');
        var priceSlider = $('.jslider').detach();
        $('.tabs ' + currentAttrValue).slideDown(400).siblings().slideUp(400);
        $(this).parent('li').addClass('active').siblings().removeClass('active');

        priceSlider.appendTo($('.tabs ' + currentAttrValue).find('.price-range-wrapper'));
        priceSlider = null;
        e.preventDefault();
    });

    $("#owl-demo-2").owlCarousel({
        items : 3,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1024:{
                items:3
            }
        },
        pagination: true,
        nav: true,
        slideSpeed: 700,
        itemsDesktop: [1024,3],
        itemsDesktop: [480,1],
        loop:true,
        navText: [
        "<i class='fa fa-chevron-left'></i>",
        "<i class='fa fa-chevron-right'></i>"
        ]
    });

    //  iCheck
    if ($('.switch').length > 0) {
        $('.switch input').iCheck();
    }
    if ($('.radio').length > 0) {
        $('input').iCheck();
    }
    if ($('.checkbox').length > 0) {
        $('input:not(.no-icheck)').iCheck();
    }

    // $('.wrapper').on('click', function (e) {
    //     if ($('.secondary').hasClass("open")) {
    //         $('.drop-left, .primary.main-menu>ul').removeClass("hidden");
    //         $('.drop-close, .secondary.main-menu>ul').addClass("hidden");
    //         setTimeout(function() {
    //             $('.primary.main-menu>ul').addClass("smooth");
    //             $('.drop-close, .secondary.main-menu>ul').removeClass("smooth");
    //         }, 100);
    //     }
    // });

    // Sliding submenu in mobile menu
    $( '.navigation .site-header .mob-menu li.has-child>a' ).on('touchstart click', function (e) {
      e.preventDefault();
      var $t=$(this).parent();
      if(!($t).hasClass("opened")) {
            $('.mob-menu .child-navigation').slideUp( "fast" );
            $('.mob-menu .child-navigation').parent().removeClass("opened");
            $($t).addClass("opened");
            $($t).children('.mob-menu .child-navigation').slideToggle( "fast" );
        } else {
            $('.mob-menu .child-navigation').slideUp( "fast" );
            $('.mob-menu .child-navigation').parent().removeClass("opened");
        }
    });

    $( '.navigation .container li.has-child>a' ).on('touchstart click', function (e) {
        e.preventDefault();
        var $t=$(this).parent();
        $($t).children('.child-navigation').slideDown( "fast" );
    });

    // Video Wrapping with container preserves width and height
    $( 'embed, iframe' ).wrap( "<div class='video-container'></div>" );


    function sliderpoint() {
        var slider_width = parseInt($(".jslider").css('width'), 10);
        var right_point = parseInt($(".jslider-pointer.jslider-pointer-to").css('left'), 10);
        var left_point = parseInt($(".firstpoint").css('left'), 10);
        left_point = 100*left_point/slider_width;
        right_point = 100*right_point/slider_width;
        if (right_point > 97) { $('.jslider-pointer.jslider-pointer-to').addClass('slide-right'); }
        if (right_point <= 97){ $('.jslider-pointer.jslider-pointer-to').removeClass('slide-right'); }
        if (left_point > 97) { $('.firstpoint').addClass('slide-right'); }
        if (left_point <= 97){ $('.firstpoint').removeClass('slide-right'); }
    }

    $('.jslider-pointer').addClass('firstpoint');
    $('.jslider-pointer.jslider-pointer-to').removeClass('firstpoint');

    $(".price-range-wrapper").mousemove(sliderpoint);

});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// On RESIZE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(window).on('resize', function(){
    equalHeight('.equal-height');
    // Set Owl Carousel width on resize window
    $('.carousel-full-width').css('width', $(window).width());
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// On LOAD
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(window).load(function(){

    //  Show counter after appear
    // var $number = $('.number');
    // var $grid;

    // if ($number.length > 0 ) {
    //     $number.waypoint(function() {
    //         initCounter();
    //     }, { offset: '100%' });
    // }

    //Masonry grid init
    // function triggerMasonry() {
    //     if ( !$grid ) { return; }
    //     $grid.masonry({
    //         itemSelector: '.grid-item'
    //     });
    // }

    // $grid = $('.grid');
    // triggerMasonry();

    // Owl Carousel
    // Disable click when dragging
    function disableClick(){
        $('.owl-carousel .property').css('pointer-events', 'none');
    }
    // Enable click after dragging
    function enableClick(){
        $('.owl-carousel .property').css('pointer-events', 'auto');
    }

    if ($('.owl-carousel').length > 0) {
        if ($('.carousel-full-width').length > 0) {
            setCarouselWidth();
        }
        if ( parseInt( $('.testimonials-carousel').find('.item').length ) <= 1 ) {
            t_f_test = false;
        } else {
            t_f_test = true;
        }
        $(".testimonials-carousel").owlCarousel({
            items: 1,
            responsiveBaseWidth: ".testimonial",
            pagination: true,
            nav:t_f_test,
            slideSpeed : 700,
            loop:t_f_test,
            touchDrag:t_f_test,
            mouseDrag:t_f_test,
            navText: [
            "<i class='fa fa-chevron-left'></i>",
            "<i class='fa fa-chevron-right'></i>"
            ],
        });
    }
    function sliderLoaded(){
        $('#slider').removeClass('loading');
        document.getElementById("loading-icon").remove();
        centerSlider();
    }
    function animateDescription(){
        var $description = $(".slide .overlay .info");
        $description.addClass('animate-description-out');
        $description.removeClass('animate-description-in');
        setTimeout(function() {
            $description.addClass('animate-description-in');
        }, 400);
    }

    //Preloader
    // var $preloader = $('#page-preloader');
    // $preloader.fadeOut('slow');
    // $spinner = $preloader.find('.gps_ring');
    // $spinner2 = $preloader.find('.gps_ring2');
    // $spinner.fadeOut();
    // $spinner2.fadeOut();

});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Functions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  Equal heights
function equalHeight(container) {
    var currentTallest = 0,
    currentRowStart = 0,
    rowDivs = new Array(),
    $el,
    topPosition = 0;
    $(container).each(function() {

        $el = $(this);
        $($el).height('auto');
        topPostion = $el.position().top;

        if (currentRowStart != topPostion) {
            for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
                rowDivs[currentDiv].height(currentTallest);
            }
            rowDivs.length = 0; // empty the array
            currentRowStart = topPostion;
            currentTallest = $el.height();
            rowDivs.push($el);
        } else {
            rowDivs.push($el);
            currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
        }
        for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
            rowDivs[currentDiv].height(currentTallest);
        }
    });
}

//funny numbers counter
function initCounter(){
    $('.number').countTo({
        speed: 3000,
        refreshInterval: 50,
        onComplete: function (value) {
            window.initCounter=function(){return false;};
        }
    });
}

// Set Owl Carousel width
function setCarouselWidth(){
    $('.carousel-full-width').css('width', $(window).width());
}
