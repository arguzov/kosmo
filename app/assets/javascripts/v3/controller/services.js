//=require v3/common
//=require v3/plugins/owl-carousel/owl.carousel.min
//=require v3/plugins/magnific-popup/jquery.magnific-popup.min
//=require v3/plugins/jquery.appear
//=require v3/plugins/jquery.countTo
//=require v3/plugins/jquery.parallax-1.1.3
//=require v3/plugins/jquery.images-compare

$(document).ready(function(){
    $('.sidebar').affix({
        offset: {
            top: 100,
            bottom: function () {
                return (this.bottom = $('#footer').outerHeight(true))
            }
        }
    })

    $('#global-pricelist h4 a').click(function(){
        var css = $(this).children('i').attr('class');
        if(css == 'fa fa-caret-down'){
            $(this).children('i').removeClass('fa-caret-down').addClass('fa-caret-right');
        }else{
            $(this).children('i').removeClass('fa-caret-right').addClass('fa-caret-down');
        }
    })

    $('.img-compare').imagesCompare();
	/*$(".image-box a").magnificPopup({ 
		type: 'image'
	});*/
})