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
//= require manager/plugins/jquery.synctranslit
//= require redactor-rails

$(document).ready(function(){
    $('textarea').redactor();
    if($('#shop_product_name').length > 0) {
        $('#shop_product_name').syncTranslit({destination: "shop_product_url"});
    }
    if($('#nestable').length > 0) {
        $('#nestable').nestable();
        $('.dd').nestable('collapseAll');
    }

    $('.dataTables-grid').dataTable({
        paging: true,
        responsive: true,
        "pageLength": 50,
        /*"dom": 'T<"clear">lfrtip'*/
        "sDom": 'T<"clear">lfrtip',
        "oTableTools": {
            "aButtons": [
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

    $('#shop-products-list .changeable').change(function(){
        var obj = $(this);
        changeProductField(obj);
    });

    $('#shop-products-list .editable').click(function(){
        var obj = $(this);
        changeProductField(obj);
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

    $('#manager-prices select').change(function(){
        var id = $(this).closest('tr').attr('data-price_id');
        var field = $(this).attr('name');
        var val = $(this).val();
        var url = '/manager/prices';
        var method = 'POST';
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

    function changeProductField(obj){
        var id = obj.closest('tr').attr('data-id');
        var name = obj.attr('data-name');
        var value = null;
        var url = null;
        if(name == 'fl_show' || name == 'fl_best_seller') {
            var fl = obj.find('i');
            if (fl.size() > 0) {
                obj.html('');
                value = 0;
            } else {
                obj.html('<i class="fa fa-check"></i>');
                value = 1;
            }
            id = obj.attr('data-id');
        }
        if(name == 'category_id'){
            value = obj.find('select').val();
        }
        if(name == 'price'){
            value = obj.find('input').val();
            id = obj.attr('data-id');
        }
        url = '/manager/shop/products/update_field';
        var method = 'POST';
        $.ajax({ url: url,
            type: method,
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: {id: id, name: name, value: value},
            success: function(response) {
                if(response.status == 'ok'){
                    //document.location.reload();
                }
            }
        });
    }

})