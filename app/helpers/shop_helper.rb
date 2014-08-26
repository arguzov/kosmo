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
end
