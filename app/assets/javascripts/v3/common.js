//=require v3/base/jquery.min
//=require v3/base/bootstrap.min
//=require v3/base/template
//=require v3/plugins/modernizr
//=require v3/plugins/isotope/isotope.pkgd.min
//=require v3/plugins/jquery.validate
//=require v3/plugins/toastr/toastr.min
//=require v3/plugins/owl-carousel/owl.carousel
$(document).ready(function(){
    if($('#vk').length > 0) {
        $('#vk').modal();
    }
    if($('#modal-show').length > 0){
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-center",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.success($('#modal-show').html());
    }
    $('.promo-order').click(function(){
        var text = $(this).attr('data-title');
        $('#message4').val('Я хочу записаться по акции "' + text + '"');
    })
});