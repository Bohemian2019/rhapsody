class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)

    if @label.save
      flash[:notice] = "レーベルが登録されました"
    else
      render :new
    end
  end

  private

  def label_params
    params.require(:label).permit(:label_name)
  end
end
