// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require plugins/tools
//= require plugins/slick.min
//= require plugins/pajinate
//= require plugins/colorbox
//= require plugins/time_circles
//= require plugins/bootstrap.min
//= require plugins/readmore.min
//= require plugins/jquery.cookie
//= require controller/shop
//= require controller/manager

$(document).ready(function(){
    if($('#vk').length > 0) {
        $('#vk').modal();
    }
    $('#promos-top').slick({
        autoplay: true,
        autoplaySpeed: 6000,
        onInit: function(){
            $('#promos-top div').show();
        }
    });
    $('#medicaments').pajinate({
        items_per_page : parseInt($('#medicaments').attr('data-items'))
    });
    $('#diplomas').pajinate({
        items_per_page : parseInt($('#diplomas').attr('data-items'))
    });
    $(".youtube").colorbox({iframe:true, innerWidth:640, innerHeight:390});
    $(".diplomas").colorbox({rel:'diplomas',width:"50%", height:"75%"});
    $(".photos").colorbox({rel:'photos',width:"50%", height:"75%"});
    if($('#modal-show').length > 0){
        var id = $('#modal-show').attr('data-id');
        $('#' + id).modal();
    }
    $("#countdown").TimeCircles({fg_width: 0.05});

    $('#global-pricelist h4 a').click(function(){
        var css = $(this).children('i').attr('class');
        if(css == 'icon-arrow-down-bold'){
            $(this).children('i').removeClass('icon-arrow-down-bold').addClass('icon-arrow-up-bold');
        }else{
            $(this).children('i').removeClass('icon-arrow-up-bold').addClass('icon-arrow-down-bold');
        }
    })

    $('.descr').readmore({
        maxHeight: 220,
        speed: 100,
        moreLink: '<br><a href="#">Читать далее</a>',
        lessLink: '<br><a href="#">Свернуть текст</a>',
        embedCSS: true,
        sectionCSS: 'display: block; width: 100%;',
        startOpen: false,
        expandedClass: 'readmore-js-expanded',
        collapsedClass: 'readmore-js-collapsed',

// callbacks
        beforeToggle: function(){},
        afterToggle: function(){}
    });

    $('#sort').change(function(){
        document.location.href = '/responces?sort=' + $(this).val();
    })
    if($('#global-pricelist').length == 0 && $('#menu-services').length > 0) {
        var current = parseInt($('#menu-services').attr('data-current'));
        for(i = 1;i< 9;i++) {
            if(i != current) {
                $('#collapse' + i).collapse();
            }
        }
        var issues = [14,15,16,17,37,50];
        var current = parseInt($('#menu-issues').attr('data-current'));
        for(var i in issues){
            if(issues[i] != current) {
                $('#collapse' + issues[i]).collapse();
            }
        }
    }

    if($('#shop-menu').length > 0){
        var current = parseInt($('#shop-menu').attr('data-current'));
        $('#shop-menu .panel-collapse').each(function(){
            var id = parseInt($(this).attr('id').replace('collapse',''));
            console.log(id);
            if(id != current) {
                $(this).collapse();
            }
        })

    }
});

