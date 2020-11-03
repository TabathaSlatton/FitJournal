module ApplicationHelper

    def current_date
        Time.now.strftime('%A, %b %d')
    end
end
