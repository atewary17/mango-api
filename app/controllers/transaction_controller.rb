class TransactionController < ApplicationController\
    
    def show_profile
        @user=current_user
    end

    def index
      user_id = params[:user_id]
      @sales = Sale.all
      @sales = @sales.where(user_id: user_id) if user_id.present?
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

    def filter
        user_id = params[:user_id]
        town = params[:town]
        if user_id.blank? && town.blank?
          render json: { error: 'At least one parameter (user_id or town) is required' }, status: :bad_request
          return
        end
        begin
          @sales = Sale.all
          @sales = @sales.where(user_id: user_id) if user_id.present?
          @sales = @sales.where(town: town) if town.present?
          render json: @sales
        rescue => e
          render json: { error: e.message }, status: :internal_server_error
        end
    end
end