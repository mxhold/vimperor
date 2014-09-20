class OptionSetsController < ApplicationController
  def new
    @option_set = OptionSet.new
  end

  def create
    @option_set = OptionSet.new(option_set_params)
    if @option_set.save
      file = Tempfile.new('vimrc')
      file.write(@option_set.generate_file)
      file.flush
      send_file file, filename: 'vimrc', type: :text, status: :created
    else
      flash[:error] = "vimrc file could not be generated."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def option_set_params
    params.require(:option_set).permit(:compatible)
  end
end
