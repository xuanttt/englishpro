class Plan < ActiveRecord::Base
    belongs_to :user
    
    def task_completed
      # UserLog.where({ :created_at => plan.created_at..Time.now}, {:user => self}).count
      user.user_logs.where({ :created_at => self.created_at...DateTime.now}).count
    end
    
    def task_completed_chart_data
      # UserLog.where({ :created_at => plan.created_at..Time.now}, {:user => self}).count
      user.user_logs.where({ :created_at => self.created_at..DateTime.now}).group("strftime('%Y-%m-%d', created_at)").count
      # user.user_logs.group_by_day(:created_at, range: self.created_at..DateTime.now).count
    end
    
    def is_over?
        if (Date.today > deadline) then return true
        else return false
        end
    end
    
    def is_completed
        if (task_completed >= how_many) then return true
        else return false
        end
    end

    def day_remaining
        deadline.to_date - Date.today + 1
    end
    
end
