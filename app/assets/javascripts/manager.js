//= require manager/jquery-2.1.1
//= require jquery_ujs
//= require manager/plugins/bootstrap.min
//= require manager/plugins/jquery.metisMenu
//= require manager/plugins/jquery.slimscroll.min
//= require manager/plugins/pace.min
//= require manager/plugins/jquery.peity.min
//= require manager/plugins/jquery.nestable
//= require manager/plugins/dataTables/jquery.dataTables
//= require manager/plugins/dataTables/dataTables.bootstrap
//= require manager/plugins/dataTables/dataTables.responsive
//= require manager/plugins/dataTables/dataTables.tableTools.min
//= require manager/inspinia/inspinia
//= require manager/inspinia/peity-demo
//= require redactor-rails

$(document).ready(function(){
    $('textarea').redactor();
    if($('#nestable').length > 0) {
        $('#nestable').nestable();
        $('.dd').nestable('collapseAll');
    }
    $('.dataTables-grid').dataTable({
        paging: true,
        responsive: true,
        /*"dom": 'T<"clear">lfrtip'*/
        "sDom": 'T<"clear">lfrtip',
        "oTableTools": {
            "aButtons": [
                "print"
            ]
        },
        "language": {
            "sProcessing":   "Подождите...",
            "sLengthMenu":   "Показать _MENU_ записей",
            "sZeroRecords":  "Записи отсутствуют.",
            "sInfo":         "Записи с _START_ до _END_ из _TOTAL_ записей",
            "sInfoEmpty":    "Записи с 0 до 0 из 0 записей",
            "sInfoFiltered": "(отфильтровано из _MAX_ записей)",
            "sInfoPostFix":  "",
            "sSearch":       "Поиск: ",
            "sUrl":          "",
            "oPaginate": {
                "sFirst": "Первая",
                "sPrevious": "Предыдущая",
                "sNext": "Следующая",
                "sLast": "Последняя"
            },
            "oAria": {
                "sSortAscending":  ": активировать для сортировки столбца по возрастанию",
                "sSortDescending": ": активировать для сортировки столбцов по убыванию"
            }
        }
        /*"tableTools": {
         "sSwfPath": "js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
         }*/
    });
    $('#product-prices .do').click(function(){
        var tr = $(this).closest('tr');
        var id = tr.attr('data-id');
        var product_id = $('#product-prices').attr('data-id');
        if(parseInt(id) > 0) {
            var url = '/manager/shop/product/items/' + id;
            var method = 'PATCH';
        }else{
            var url = '/manager/shop/product/items/';
            var method = 'POST';
        }
        $.ajax({ url: url,
            type: method,
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: {id: id,
                   product_id: product_id,
                   volume: tr.find('input[name=volume]').val(),
                   price: tr.find('input[name=price]').val(),
                   color: tr.find('input[name=color]').val(),
                   unit: tr.find('select[name=unit]').val()},
            success: function(response) {
                if(response.status == 'ok'){
                    document.location.reload();
                }
            }
        });
    })

    $('#manager-prices .sh').click(function(){
        var id = $(this).attr('data-id');
        $('.sr').filter('[data-id="'+id+'"]').css('display','table-row');
        if($(this).find('.badge').first().html() == '+'){
            $('.sr').filter('[data-id="'+id+'"]').css('display','table-row');
            $(this).find('.badge').first().html('-');
        }else{
            $('.sr').filter('[data-id="'+id+'"]').css('display','none');
            $(this).find('.badge').first().html('+');
        }
    })

    $('#manager-prices input').change(function(){
        var id = $(this).closest('tr').attr('data-price_id');
        var field = $(this).attr('name');
        var val = $(this).val();
        var url = '/manager/prices';
        var method = 'POST';
        if(field == 'is_new_only'){
            if($(this).prop('checked')){
                val = 1;
            }else{
                val = 0;
            }
        }
        $.ajax({ url: url,
            type: method,
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: {id: id,
                    field: field,
                    value: val},
            success: function(response) {
                if(response.status == 'ok'){
                    //document.location.reload();
                }
            }
        });
    })

})