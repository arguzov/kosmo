//=require v3/common
$(document).ready(function() {
    $('#delivery-flag').click(function () {
        var price = parseInt($('#product-price').attr('data-price'));
        var delivery_price = 0
        if ($(this).html() == 'Нужна доставка') {
            if (price < 2399) {
                delivery_price = 150;
            }
            $('#delivery-address').removeClass('hidden');
            $(this).html('Не нужна доставка');
            $('#delivery-price').html(delivery_price);
            $('#delivery-row').removeClass('hidden');
        } else {
            $('#delivery-address').addClass('hidden');
            $('#delivery-row').addClass('hidden');
            $(this).html('Нужна доставка');
            $('#address').val('');
        }
        $('#sum').val(price + delivery_price);
        $('#total').html(price + delivery_price);
    })
})

