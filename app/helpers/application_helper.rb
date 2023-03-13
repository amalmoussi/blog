module ApplicationHelper
    def icon(name)
        content_tag :span, class: 'material-icons' do
            name
        end
    end
end
