class ChangeValueDefaultValueInReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :value, '1-5'
  end
end
