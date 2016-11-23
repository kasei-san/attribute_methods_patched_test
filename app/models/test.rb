class Test < ApplicationRecord
  enum status:   { inactive: 0, active: 1 }
  def get_status
    binding.pry
    self[:status]
  end
  def get_status2
    binding.pry
    self.status
  end
end
