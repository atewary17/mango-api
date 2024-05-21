class TransactionController < ApplicationController\
    
    def show_profile
        @user=current_user
    end

    def import
        file = params[:excel_file]
        if file.present? && file.respond_to?(:read)
            begin
                SalesImporter.import(file)
                redirect_to root_path, notice: "Sales imported successfully."
            rescue => e
                redirect_to root_path, alert: "Failed to import sales: #{e.message}"
            end
        else
          redirect_to root_path, alert: "Please select a file."
        end
    end

    def import_from
    end
end