class AdminSystem::NewspapersController < AdminSystemController
    def index
        @newspapers = Newspaper.all
    end

    def create
        Newspaper.transaction do
            @newspaper = Newspaper.new(newspaper_params)
            @newspaper.save!
            reading_material = ReadingMaterial.new(title: params[:title], material: @newspaper)
            reading_material.save!

            render json: { message: "Newspaper created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
        end
    end

    def show
        @newspaper = Newspaper.find(params[:id])
    end

    def destroy
        @newspaper = Newspaper.find(params[:id])
        @newspaper.destroy
        render json: { message: "Newspaper deleted successfully" }, status: 200
    end

    private
    def newspaper_params
        params.permit(:publisher, :issue_date)
    end
end