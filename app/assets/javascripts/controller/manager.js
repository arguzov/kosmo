$(document).ready(function(){
    $('#manager-orders .btn').click(function(){
        var id = $(this).attr('data-id');
        $('#order-id').val(id);
    })

    $('#process-order').click(function(){
        $.ajax({
            type: 'PUT',
            url: "/manager/orders/"+$('#order-id').val(),
            data: {order: {fl_status: $('#order-status').val(),comment: $('#order-comment').val()}},
            success: function(data) {
                document.location.reload();
            }
        });
    })
})