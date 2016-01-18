class RankingController < ApplicationController
    
    def create
    end
    
    def show
        @ranking = Ranking.find(params[:id])
        @ranking = Ranking.find(:all, :order => "Ranking Desc")
        
    end
    def destroy
    end
end
