class MakersController < ApplicationController
  before_action :authenticate_user!
  def index
    @makers = Maker.all
  end

  def new
  end

  def create
    maker = Maker.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
      if maker.save #세이브 되는 순간 유효성 검사로 돌입, 실패하면 저장 안해
        redirect_to "/makers/#{maker.id}"
      else
        flash[:msg] = "제목 혹은 내용이 비어있으면 안돼요"
        redirect_to new_maker_path
      end
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    @maker.update(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
      redirect_to makers_path
  end

  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy
  end
end
