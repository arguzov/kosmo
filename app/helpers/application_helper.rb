module ApplicationHelper

    def alt_tags(text,tag_text)
        text = text.gsub('<img',"<img alt=\"#{tag_text}\" title=\"#{tag_text}\"")
        return text
    end


end
