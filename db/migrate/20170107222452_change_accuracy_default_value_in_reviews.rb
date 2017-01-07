class ChangeAccuracyDefaultValueInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :accuracy, '1-5'
  end
end
