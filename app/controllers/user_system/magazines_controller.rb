class UserSystem::MagazinesController < UserSystemController
    def index
        @magazines = Magazine.all
    end

    def create
        Magazine.transaction do
            @magazine = Magazine.new(magazine_params)
            @magazine.save!
            reading_material = ReadingMaterial.new(title: params[:title], material: @magazine)
            reading_material.save!

            render json: { message: "Magazine created successfully" }, status: 200
        rescue => e
            render json: { message: e.message }, status: :unprocessable_entity
        end
    end

    def show
        @magazine = Magazine.find(params[:id])
    end

    def destroy
        @magazine = Magazine.find(params[:id])
        @magazine.destroy
        render json: { message: "Magazine deleted successfully" }, status: 200
    end

    private
    def magazine_params
        params.permit(:volume, :author, :issue)
    end
end