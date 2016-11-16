class ChirpsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def chirp_params
    params.require(:chirp).permit(:user, :content)
  end

end
