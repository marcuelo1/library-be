class UserSystem::ThesesController < UserSystemController
    def index
        @theses = Thesis.all
    end

    def show
        @thesis = Thesis.find(params[:id])
    end
end