class UserSystem::MagazinesController < UserSystemController
    def index
        @magazines = Magazine.all
    end

    def create
        @magazine = Magazine.new(magazine_params)

        if @magazine.save
            render json: { message: "Magazine created successfully" }, status: 200
        else
            render json: @magazine.errors, status: :unprocessable_entity
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