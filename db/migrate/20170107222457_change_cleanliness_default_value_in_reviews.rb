class ChangeCleanlinessDefaultValueInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :cleanliness, '1-5'
  end
end
