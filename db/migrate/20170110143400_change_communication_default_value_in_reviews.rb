class ChangeCommunicationDefaultValueInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :communication, '1-5'
  end
end
