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
end
