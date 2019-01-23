class ItemsController < ApplicationController
  def show
    @cart_item = CartItem.new
    @item = Item.includes(:songs, :artist, :label).find(params[:id])
    # 商品枚組情報取得
    @songs = Song.where(:item_id => (params[:id]))
    # 商品枚組情報取得
    @count = @songs.select(:disc_number).distinct.count(:disc_number)
    # 2枚組以上の場合、ディスク毎に連番のインスタンス変数を作成
    if @count >= 2
      @count.times do |c|
        num = c+1
        eval("@disc#{num} = @songs.where(:disc_number => #{num})")
      end
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if Artist.exists?(artist_name: @item.artist_name)
      @item[:artist_id] = Artist.find_by(artist_name: @item.artist_name).id
    end
    
    if @item.save
      redirect_to root_path
      flash[:notice] = "商品を新たに登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def cart_create
    ci = CartItem.new(ci_params)
    ci.item_id = (params[:id])
    # カート情報
    cart = ShoppingCart.find_by(user_id: current_user.id, is_active: true)
    ci.shopping_cart_id = cart.id
    if ci.save
      flash[:success] = "商品をカートに追加しました"
      redirect_to shopping_cart_show_path(cart.id)
    else
      flash[:danger] = "追加に失敗しました"
      render :new
    end
  end

  private
  def ci_params
    params.require(:cart_item).permit(:quantity)
  end

  def item_params
    params.require(:item).permit(:artist_name, :item_name, :image, :price, :label_name, :genre, :stock, :item_id, :label_id)
  end
end
