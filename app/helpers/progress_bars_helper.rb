module ProgressBarsHelper

  @@icon_mapper = {
      :planned => 'icon-calendar blue',
      :delayed  => 'icon-time orange',
      :canceled => 'icon-ban-circle red' ,
      :completed => 'icon-ok green'
  }

  def percentage(tasks)
    totals = { :completed => 0, :delayed => 0,  :planned => 0, :canceled => 0 }
    tasks.each { |task|
      totals[:completed] += 1 if task.completed?
      totals[:delayed] += 1 if task.delayed?
      totals[:planned] += 1 if task.planned?
      totals[:canceled] += 1 if task.canceled?
    }

    result ={}
    totals.each { |k,v|
      result[k]= (v/tasks.size.round(2) * 100.0).round(2)
    }
    result
  end


  def marker_icon(task)
    return @@icon_mapper[task.current_status]
  end



end
