//=require v3/plugins/toastr/toastr.min
//=require v3/plugins/jquery.maskedinput
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

    $('.m-act').click(function() {
        var obj = $(this);
        $.ajax({
            url: '/api/metrika/register',
            type: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            data: {
                service_id: obj.attr('data-service'),
                action_id: obj.attr('data-action')
            }
        });
    });

    if ($('#global-pricelist').length > 0) {
        $('.discount-row').each(function(){
            var exists = [];
            var id = $(this).attr('data-id');
            if ($.inArray(id, exists) < 0) {
                $('.discount-' + id).removeClass('hidden');
                exists.push(id);
            }
            $(this).closest('.panel-collapse').prev().find('.collapsed-discount').removeClass('hidden');
        })
    }

});