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
  end

  def update
  end

  def destroy
  end

  private

  def chirp_params
    params.require(:chirp).permit(:user_id, :content)
  end

end
