class AdminSystem::RequestExtensionsController < AdminSystemController
    def index
        @request_extensions = RequestExtension.all
    end
    
    def show
        @request_extension = RequestExtension.find(params[:id])
    end

    def approve 
        @request_extension = RequestExtension.find(params[:id])
        
        if @request_extension.update(status: "approved")
            @request_extension.borrow.update(due_date: @request_extension.borrow.due_date + 7.days)
            
            render json: { message: "Request extension approved successfully" }, status: 200
        else
            render json: { message: "Request extension approved failed" }, status: :unprocessable_entity
        end
    end

    def rejected
        @request_extension = RequestExtension.find(params[:id])
        
        if @request_extension.update(status: "rejected")
            render json: { message: "Request extension rejected successfully" }, status: 200
        else
            render json: { message: "Request extension rejected failed" }, status: :unprocessable_entity
        end
    end
end