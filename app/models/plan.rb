class Plan < ActiveRecord::Base
    belongs_to :user
    
    def task_completed
      # UserLog.where({ :created_at => plan.created_at..Time.now}, {:user => self}).count
      user.user_logs.where({ :created_at => self.created_at..DateTime.now}).count
    end
    
    def is_over?
        if (deadline < Date.today) then return true
        else return false
        end
    end

    def day_remaining
        deadline - Date.today
    end
    
end
