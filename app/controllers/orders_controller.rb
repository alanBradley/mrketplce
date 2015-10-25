class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # User must be signed in to make an order
  before_action :authenticate_user!

  # order history pages actions
  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    # allows for listing id of ordered product to be found in the url
    @listing = Listing.find(params[:listing_id])
    # seller is the same as the user who created the listing
    @seller = @listing.user

    # the 3 new data entries in the order database (listing_id buyer_id seller_id)
    @order.listing_id = @listing.id
    # current user will be the buyer id of the order
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    # Stripe payment code
    # Tell Stripe our secret key to charge card 
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    # params pulls token from hidden form field and set as variable token
    token = params[:stripeToken]

    # code from API page to charge a card https://stripe.com/docs/api#create_charge
    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.price * 100).floor,
        :currency => "eur",
        :card => token
        )
      flash[:notice] = "Thanks for ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :country)
    end
end
