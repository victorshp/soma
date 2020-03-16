class AddPriceToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_monetize :surveys, :price, currency: { present: false }
  end
end
