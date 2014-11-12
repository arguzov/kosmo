$(document).ready(function(){
    load_cart_data();
    add_to_cart();
    //add_to_viewed();
    $('#shop-cart .remove').click(function(){
        var id = $(this).closest('tr').attr('id').replace('item-','');
        var cookie = $.cookie('cart');
        if(cookie != undefined){
            var a = cookie.split(',');
            var index = a.indexOf(id);
            if (index > -1) {
                a.splice(index, 1);
            }
            cookie = a.join(',');
        }
        $.cookie('cart',cookie, { expires: 7, path: '/' });
        document.location.reload();
    })

    function load_cart_data(){
        if($('#cart-wrapper').length < 1){
            return;
        }
        $.getJSON('/shop/data/cart',{},function(data){
            var cart_html = '';
            var viewed_html = '';
            $.each(data.cart,function(index,row){
                cart_html += '<a href="/shop/product/'+ row.url +'.html" title="'+row.name+'"><img alt="'+row.name+'" src="'+row.photo_url+'"></a>';
            })
            $.each(data.viewed,function(index,row){
                viewed_html += '<a href="/shop/product/'+ row.url +'.html" title="'+row.name+'"><img alt="'+row.name+'" src="'+row.photo_url+'"></a>';
            })
            if(cart_html == ''){
                cart_html = '<div class="empty"><a href="/shop"><i class="glyphicon glyphicon-plus"></i></a></div>';
                $('#cart-top .btn').attr('disabled','disabled');
            }
            if(viewed_html == ''){
                viewed_html = '<div class="empty"><a href="/shop"><i class="glyphicon glyphicon-plus"></i></a></div>';
            }
            $('#cart-wrapper').html(cart_html);
            $('#viewed-wrapper').html(viewed_html);
        })
    }

    function add_to_viewed(){
        if($('#product').length < 1){
            return;
        }
        var cookie = $.cookie('viewed');
        var id = $('#product').attr('data-id');
        if(cookie != undefined){
            var a = (cookie.split(',')).slice(0,10);
            if(a.in_array(id) == false){
                a.unshift(id);
            }
            cookie = a.join(',');
        }else{
            cookie = id;
        }
        $.cookie('viewed',cookie, { expires: 7, path: '/' });
    }

    function add_to_cart(){
        $('.add-to-cart').click(function(){
            var id = $(this).attr('data-item');
            var cookie = $.cookie('cart');
            if(cookie != undefined){
                var a = cookie.split(',');
                if(a.in_array(id) == false){
                    a.push(id);
                }
                cookie = a.join(',');
            }else{
                cookie = id;
            }
            $.cookie('cart',cookie, { expires: 7, path: '/' });
            load_cart_data();
        })
    }
})