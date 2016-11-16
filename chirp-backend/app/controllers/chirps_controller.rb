class ChirpsController < ApplicationController

  def index
    render :json => Chirp.all, status: 200
  end

  def create
    chirp = Chirp.create(chirp_params)

    if chirp.valid?
      render :json => chirp, status: 201
    else
      render :json => {error: "Chirp validation failed"}, status: 400
    end
  end

  def edit
    chirp = Chirp.find(params[:id])

    render :json => chirp, status: 200
  end

  def update
    chirp = Chirp.find(params[:id])

    if chirp.update_attributes(chirp_params)
      render :json => {success: "Chirp updated successfully"}, status: 204
    else
      render :json => {error: "Failed to update User"}, status: 400
    end
  end

  def destroy
  end

  private

  def chirp_params
    params.require(:chirp).permit(:user_id, :content)
  end

end
