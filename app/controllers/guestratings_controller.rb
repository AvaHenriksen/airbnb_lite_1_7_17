class GuestratingsController < ApplicationController
  def index
    @q = Guestrating.ransack(params[:q])
    @guestratings = @q.result(:distinct => true).includes(:host, :guest, :booking).page(params[:page]).per(10)

    render("guestratings/index.html.erb")
  end

  def show
    @guestrating = Guestrating.find(params[:id])

    render("guestratings/show.html.erb")
  end

  def new
    @guestrating = Guestrating.new

    render("guestratings/new.html.erb")
  end

  def create
    @guestrating = Guestrating.new

    @guestrating.host_id = params[:host_id]
    @guestrating.guest_id = params[:guest_id]
    @guestrating.booking_id = params[:booking_id]
    @guestrating.body = params[:body]
    @guestrating.rating = params[:rating]

    save_status = @guestrating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/guestratings/new", "/create_guestrating"
        redirect_to("/guestratings")
      else
        redirect_back(:fallback_location => "/", :notice => "Guestrating created successfully.")
      end
    else
      render("guestratings/new.html.erb")
    end
  end

  def edit
    @guestrating = Guestrating.find(params[:id])

    render("guestratings/edit.html.erb")
  end

  def update
    @guestrating = Guestrating.find(params[:id])

    @guestrating.host_id = params[:host_id]
    @guestrating.guest_id = params[:guest_id]
    @guestrating.booking_id = params[:booking_id]
    @guestrating.body = params[:body]
    @guestrating.rating = params[:rating]

    save_status = @guestrating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/guestratings/#{@guestrating.id}/edit", "/update_guestrating"
        redirect_to("/guestratings/#{@guestrating.id}", :notice => "Guestrating updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Guestrating updated successfully.")
      end
    else
      render("guestratings/edit.html.erb")
    end
  end

  def destroy
    @guestrating = Guestrating.find(params[:id])

    @guestrating.destroy

    if URI(request.referer).path == "/guestratings/#{@guestrating.id}"
      redirect_to("/", :notice => "Guestrating deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Guestrating deleted.")
    end
  end
end
