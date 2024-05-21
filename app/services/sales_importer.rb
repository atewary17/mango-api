require 'roo'

class SalesImporter
  def self.import(file)
    begin
        spreadsheet = Roo::Spreadsheet.open(file.path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            Sale.create!(
                date: row['date'],
                store: row['store'],
                town: row['town'],
                store_code: row['store_code'],
                country: row['country'],
                user_id: row['user_id'],
                category: row['category'],
                sale: row['sale']
            )
         end
        rescue => e
            Rails.logger.error "Failed to import sales: #{e.message}"
            raise "Failed to import sales: #{e.message}"
        end
    end
end
