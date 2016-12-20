//=require v3/common
//=require v3/plugins/owl-carousel/owl.carousel.min
//=require v3/plugins/magnific-popup/jquery.magnific-popup.min
//=require v3/plugins/jquery.appear
//=require v3/plugins/jquery.countTo
//=require v3/plugins/jquery.parallax-1.1.3

$(document).ready(function(){
    $('#cert_price').change(function() {
        $('#forpay').html($(this).val());
    });
})