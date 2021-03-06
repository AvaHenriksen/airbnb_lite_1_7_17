class ListingsController < ApplicationController
  before_action :current_user_must_be_listing_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_listing_host
    listing = Listing.find(params[:id])

    unless current_user == listing.host
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Listing.ransack(params[:q])
    @listings = @q.result(:distinct => true).includes(:host, :reviews, :bookmarks).page(params[:page]).per(10)

    render("listings/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new
    @listing = Listing.find(params[:id])

    render("listings/show.html.erb")
  end

  def new
    @listing = Listing.new

    render("listings/new.html.erb")
  end

  def create
    @listing = Listing.new

    @listing.title = params[:title]
    @listing.private_room_or_entire_home = params[:private_room_or_entire_home]
    @listing.photos = params[:photos]
    @listing.description = params[:description]
    @listing.bedrooms = params[:bedrooms]
    @listing.bathrooms = params[:bathrooms]
    @listing.beds = params[:beds]
    @listing.max_occupants = params[:max_occupants]
    @listing.neighborhood = params[:neighborhood]
    @listing.city = params[:city]
    @listing.policies = params[:policies]
    @listing.default_price_per_night = params[:default_price_per_night]
    @listing.nights_available = params[:nights_available]
    @listing.price = params[:price]
    @listing.host_id = params[:host_id]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/new", "/create_listing"
        redirect_to("/listings")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing created successfully.")
      end
    else
      render("listings/new.html.erb")
    end
  end

  def edit
    @listing = Listing.find(params[:id])

    render("listings/edit.html.erb")
  end

  def update
    @listing = Listing.find(params[:id])

    @listing.title = params[:title]
    @listing.private_room_or_entire_home = params[:private_room_or_entire_home]
    @listing.photos = params[:photos]
    @listing.description = params[:description]
    @listing.bedrooms = params[:bedrooms]
    @listing.bathrooms = params[:bathrooms]
    @listing.beds = params[:beds]
    @listing.max_occupants = params[:max_occupants]
    @listing.neighborhood = params[:neighborhood]
    @listing.city = params[:city]
    @listing.policies = params[:policies]
    @listing.default_price_per_night = params[:default_price_per_night]
    @listing.nights_available = params[:nights_available]
    @listing.price = params[:price]
    @listing.host_id = params[:host_id]

    save_status = @listing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/listings/#{@listing.id}/edit", "/update_listing"
        redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Listing updated successfully.")
      end
    else
      render("listings/edit.html.erb")
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    if URI(request.referer).path == "/listings/#{@listing.id}"
      redirect_to("/", :notice => "Listing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Listing deleted.")
    end
  end
end
