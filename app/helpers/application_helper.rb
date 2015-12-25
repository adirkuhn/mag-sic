module ApplicationHelper
    def link_to_with_icon(icon_class, link_text, path, options = nil)
        return link_to(
            content_tag(:i, nil, class: icon_class) + content_tag(:span, link_text),
            path,
            options
        )
    end
end
