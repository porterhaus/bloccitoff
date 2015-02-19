class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true

  def days_left
      # This original calculation was wrong. 
      #(DateTime.now.to_date - created_at.to_date).to_i
      ((created_at.to_date + 7.days)-DateTime.now.to_date).to_i
   end
end

