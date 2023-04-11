class AdminSystem::BorrowsController < AdminSystemController
    def index
        @borrows = Borrow.all.order(created_at: :desc)
    end

    def show
        @borrow = Borrow.find(params[:id])
    end
    
    def create
        Borrow.transaction do
            @borrow = Borrow.new(borrow_params)
            date_now = Date.today
            @borrow.date = date_now
            @borrow.due_date = date_now + 7.days
            
            @borrow.save!
            render json: { message: "Borrow created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
        end
    end

    def return
        borrow = Borrow.find(params[:id])

        if borrow.update(is_borrowed: false)
            render json: { message: "#{borrow.reading_material.material_type} returned successfully" }, status: 200
        else
            render json: { message: "#{borrow.reading_material.material_type} returned failed" }, status: :unprocessable_entity
        end
    end

    private
    def borrow_params
        params.permit(:reading_material_id)
    end
end