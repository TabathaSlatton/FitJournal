module ApplicationHelper

    def current_date
        Time.now.strftime('%A, %b %d')
    end

    def pounds_lost(user)
        user.starting_weight-user.current_weight
    end

    def pounds_to_go(user)
        user.current_weight-user.goal_weight
    end

end
