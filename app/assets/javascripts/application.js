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
//= require plugins/slick.min
//= require plugins/pajinate
//= require plugins/colorbox
//= require plugins/bootstrap.min

$(document).ready(function(){
    $('#promos-top').slick({
        autoplay: true,
        autoplaySpeed: 6000
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

});

