class RankingController < ApplicationController
    
    # def create
    #  @items = Item.find(params[:item_id])
    
    # if params[:type] == 'have'
    #     @ranking = @items.order("have_users.count desc")
    #     render 'show'
    # else
    #     @ranking = @items.order("want_users.count desc")
    #     render 'show'
    # end

    # end
    
    # def show
    # end
    
    def have
        # @rainking = Have.~~~
        # 使うメソッドはgroup order limit count
        # @ranking = [{アイテムのID ： count数},{アイテムのID ： count数},{アイテムのID ： count数},{アイテムのID ： count数}]
        @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
        item_ids = @ranking.keys
        @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    end

    def want
        @ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
        item_ids = @ranking.keys
        @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    end

end
