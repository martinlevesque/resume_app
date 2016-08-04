class Education < ApplicationRecord

  validates_presence_of :period_begin, :period_end, :title

end
