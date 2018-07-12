class WorksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @works= Work.all
  end

  def new
    @maker = Maker.all
  end

  def update
    @work = Work.find(params[:id])
    @work.update(
      title: params[:title],
      desc: params[:desc],
      image: params[:image],
      maker_id: params[:maker_id]
      )
      redirect_to "/works/#{@work.id}"
  end

  def create
    #work를 데이터베이스에 만들겠다
    #데이터베이스 칼럼 생성. 보통땐 Work.create라고 했었어
    work = Work.new(
      title: params[:title],
      desc: params[:desc],
      image: params[:image],
      maker_id: params[:maker_id]
      )
      if work.save #세이브 되는 순간 유효성 검사로 돌입, 실패하면 저장 안해
        redirect_to "/works/#{work.id}"
      else
        flash[:msg] = "제목 혹은 내용이 비어있으면 안돼요"
        redirect_to new_work_path
      end
  end

  def edit
    @work = Work.find(params[:id])
    
  end

  def show
    @work = Work.find(params[:id])
    puts "!!! #{@work.maker}"
  end

  def destroy
    #지우고자 하는 글을 찾아 지운다
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end
end
