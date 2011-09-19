class Status < ActiveRecord::Base

  def find_active(_state)
    if _state == self.state 
      return "active"
    end
    return "inactive"
  end

end
