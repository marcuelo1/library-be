class UserSystem::ThesesController < UserSystemController
    def index
        @theses = Thesis.all
    end

    def create
        Thesis.transaction do
            @thesis = Thesis.new(thesis_params)
            @thesis.save!
            reading_material = ReadingMaterial.new(title: params[:title], material: @thesis)
            reading_material.save!

            render json: { message: "Thesis created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
        end
    end

    def show
        @thesis = Thesis.find(params[:id])
    end

    def destroy
        @thesis = Thesis.find(params[:id])
        @thesis.destroy
        render json: { message: "Thesis deleted successfully" }, status: 200
    end

    private
    def thesis_params
        params.permit(:author)
    end
    
end