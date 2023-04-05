class UserSystem::HomeController < UserSystemController
    def home 
        @featured = ReadingMaterial.featured
        @new_arrivals = ReadingMaterial.new_arrivals
    end
end