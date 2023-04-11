class UserSystem::NewspapersController < UserSystemController
    def index
        @newspapers = Newspaper.all
    end

    def show
        @newspaper = Newspaper.find(params[:id])
    end
end