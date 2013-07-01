module ProgressBarsHelper

  @@icon_mapper = {
      :planned => 'icon-calendar blue',
      :delayed  => 'icon-time orange',
      :canceled => 'icon-ban-circle red' ,
      :completed => 'icon-ok green'
  }

  def percentage(tasks)
    return 80
  end

  def marker_icon(task)
    return @@icon_mapper[task.current_status]
  end

end
