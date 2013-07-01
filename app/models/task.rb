class Task < ActiveRecord::Base
  belongs_to :progress_bar
  validates_presence_of :title, :body, :status, :duedate
  validates_inclusion_of :status, :in => %w(Planned Completed Canceled)

  def current_status
    return (delayed? ? :delayed : status.downcase.to_sym)
  end

  def completed?
    return status == 'Completed'
  end

  def planned?
    return (status == 'Planned' and not delayed?)
  end

  def canceled?
    return status == 'Canceled'
  end

  def delayed?
    return (duedate > Date.today and :status == 'Planned')
  end

end
