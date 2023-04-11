class UserSystem::RequestExtensionsController < UserSystemController
    def show
        @request_extension = RequestExtension.find(params[:id])
    end

    def create
        # check if the date of request extension is 3 days before the borrows due date
        borrow = Borrow.find(params[:borrow_id])
        if (borrow.due_date - Date.today).to_i < 3
            return render json: { message: "Request extension must be 3 days before the borrows due date" }, status: :unprocessable_entity
        end

        # check if number of extensions approved is less than 2 
        if borrow.num_of_request_extensions >= 2
            return render json: { message: "Number of Request Extensions already reached its maximum of 2" }, status: :unprocessable_entity
        end

        @request_extension = RequestExtension.new(request_extension_params)
        @request_extension.status = "pending"
        @request_extension.date = Date.today
        
        if @request_extension.save
            render json: { message: "Request extension created successfully" }, status: 200
        else
            render json: { message: "Request extension created failed" }, status: :unprocessable_entity
        end
    end

    private
        def request_extension_params
            params.permit(:borrow_id)
        end
    
end