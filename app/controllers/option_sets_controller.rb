class OptionSetsController < ApplicationController
  before_action :decode_hashid

  def new
    @option_set = OptionSet.new
  end

  def create
    @option_set = OptionSet.new(option_set_params)
    if @option_set.save
      render :create, status: :created, location: option_sets_path
    else
      render :create, status: :unprocessable_entity
    end
  end

  def show
    @new_option_set = OptionSet.new
    @option_set = OptionSet.find(params[:id])
  end

  def download
    @option_set = OptionSet.find(params[:id])
    send_data(
      render_to_string(
        partial: 'option_set.text.erb',
        locals: { option_set: @option_set }
      ),
      filename: 'vimrc.txt',
      type: 'text/plain'
    )
  end

  private

  def decode_hashid
    params[:id] = Hashid.decode(params[:hashid]) unless params[:hashid].blank?
  end

  def option_set_params
    params.fetch(:option_set, {}).permit(:compatible)
  end
end
