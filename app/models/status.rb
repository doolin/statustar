class Status < ActiveRecord::Base

  attr_accessible :state
  
  belongs_to      :user

  validates :state, :presence => true, :length => { :maximum => 1 }, :inclusion => { :in => 1..3 }
  validates :user_id, :presence => true
  
  default_scope :order => 'statuses.created_at DESC'


  def find_active(_state)
    if _state == self.state 
      return "active"
    end
    return "inactive"
  end

end
