class UpdateSalesFieldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "............................ahhahahahah...........lalalalala"
    # Sale.where('condition_to_update').update_all(field_to_update: 'new_value')
  end
end
