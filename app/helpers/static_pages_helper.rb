module StaticPagesHelper
    
    def current_plan_explanation(plan)
        result = "#{plan.created_at.to_date}から#{plan.deadline}までに"
        if (plan.act.eql? "Study") then result+= "レッソン#{plan.how_many}つを勉強する"
        elsif (plan.act.eql? "Test") then result += "テスト#{plan.how_many}題を合格する"
        else result += "#{plan.act}#{plan.how_many}つをする"
        end
        return result
    end
    
    def plan_explanation(plan, a)
        result = "#{a}. #{plan.created_at.to_date}から#{plan.deadline}までに"
        if (plan.act.eql? "Study") then result+= "レッソン#{plan.how_many}つを勉強する"
        elsif (plan.act.eql? "Test") then result += "テスト#{plan.how_many}題を合格する"
        else result += "#{plan.act}#{plan.how_many}つをする"
        end
        return result
    end
    
    def plan_completed(plan)
        if (plan.act.eql? "Study") then result = "#{plan.task_completed}つのレッソンを勉強した"
        elsif (plan.act.eql? "Test") then result = "#{plan.task_completed}題のテストを合格した"
        else result = "#{plan.task_completed}つの#{plan.act}をした"
        end
        return result
    end
    
    def plan_left(plan)
        if (plan.act.eql? "Study") then result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}つのレッソン残っている"
        elsif (plan.act.eql? "Test") then result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}題のテスト残っている"
        else result = "ゴールを完成するために、まだ#{plan.how_many-plan.task_completed}つの#{plan.act}残っている"
        end
        return result
    end
    
    def plan_suggestion(plan)
        if (plan.act.eql? "Study") then result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}つのレッソン勉強するのを勧めます"
        elsif (plan.act.eql? "Test") then result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}題のテスト受験するのを勧めます"
        else result = "一日、#{(Float(plan.how_many-plan.task_completed)/plan.day_remaining).round(2)}つの#{plan.act}するのを勧めます"
        end
        return result
    end
end
