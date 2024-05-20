class TransactionController < ApplicationController\
    
    def show_profile
        @user=current_user
    end
end
