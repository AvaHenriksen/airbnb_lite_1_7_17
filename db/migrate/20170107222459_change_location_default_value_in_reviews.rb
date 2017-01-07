class ChangeLocationDefaultValueInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :location, '1-5'
  end
end
