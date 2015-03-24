module ApplicationHelper

    def alt_tags(text,tag_text)
        text = text.gsub('<img',"<img alt=\"#{tag_text}\" title=\"#{tag_text}\"")
        return text
    end

    def quote_clear(text)
        return text.gsub('"','').gsub("'",'')
    end

    def words_limitation(text,count)
        return text.split(' ')[0..count - 1].join(' ')
    end

    def current_layout
        return params[:controller].split("/").first
    end

    def month(num)
        if num == '01'
            return 'января'
        elsif num == '02'
            return 'февраля'
        elsif num == '03'
            return 'марта'
        elsif num == '04'
            return 'апреля'
        elsif num == '05'
            return 'мая'
        elsif num == '06'
            return 'июня'
        elsif num == '07'
            return 'июля'
        elsif num == '08'
            return 'августа'
        elsif num == '09'
            return 'сентября'
        elsif num == '10'
            return 'октября'
        elsif num == '11'
            return 'ноября'
        elsif num == '12'
            return 'декабря'
        end
    end
end
