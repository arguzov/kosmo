module ShopHelper
    def order_total(data,discount)
        sum = 0
       data.each do |line|
           sum = sum + line[:price] - (line[:price]*discount)/100
       end
       return sum
    end

    def cart_items_count
        if cookies.has_key?('cart')
            count = cookies[:cart].split(/,/).count
            return "#{count} товаров"
        else
            return 'нет товаров'
        end
    end

    def categories_tree
        return category_node(0).html_safe
    end

    def category_node(parent_id)
        categories = ShopCategory.where('parent_id = ?',parent_id).order('name ASC')
        if categories.length == 0
            return ''
        end
        html =  '<ol class="dd-list">'
        categories.each do |category|
            children = ''
            #if category.level < 4
            children = self.category_node(category.id)
            #end
            html += '<li class="dd-item">'
            if children.to_s == ''
                html += '<div class="dd-handle dd-nodrag">'
                html += '' + category.name + ''
                html += ' <a href="/manager/shop/categories/'+category.id.to_s+'/edit" class="pull-right" data-id="'+category.id.to_s+'"><i class="fa fa-edit"></i></a>'
                html += '</div>'
            else
                html += '<div class="dd-handle dd-nodrag">'
                html += category.name
                html += '</div>'
            end
            html += children
            html += '</li>'
        end
        html += '</ol>'
        return html
    end
end
