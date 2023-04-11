class UserSystem::MagazinesController < UserSystemController
    def index
        @magazines = Magazine.all
    end

    def show
        @magazine = Magazine.find(params[:id])
    end
end