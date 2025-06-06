class EntriesController < ApplicationController

  def new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create

    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
        @entry["user_id"] = session["user_id"]
    @entry.save
        @entry.uploaded_image.attach(params["uploaded_image"])
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
