class LostController < ApplicationController
  before_action { ActiveStorage::Current.url_options = Rails.application.config.action_controller.
  default_url_options }

  def index
  end
  
  def all_records
    @records = Stuff.all
  end

  def admin_login
  end

  def admin_log
    @admin = Admin.find_by(username: params["user"], password: params["pass"])
    if @admin
      redirect_to "/admin_dash"
    else
      redirect_to "/admin_login"
    end
  end

  def admin_dashboard
  end

  def item_reg
  end
  
  def item
    @item = Stuff.new(form_params)
    if params[:image].present?
      uploaded_file = params[:image]
      @item.image = uploaded_file
    end
  
    if @item.save
      redirect_to "/home"
    else
      render :new
    end
  end

  def form_params
    params.permit(:item_name, :description, :location, :contact, :image)
  end  

  def view
    @view = Stuff.all
  end

  def approve
    claim = Stuff.find(params[:id])
    approved = Claimed.new(
      item_name: claim.item_name,
      description: claim.description,
      location: claim.location,
      contact: claim.contact,
      image: claim.image.attached? ? claim.image.blob : nil
    )
    approved.save
    claim.destroy

    redirect_to "/view"
  end

  def claim
    @claim = Claimed.all


end
end
