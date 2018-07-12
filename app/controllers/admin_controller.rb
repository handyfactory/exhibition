class AdminController < ApplicationController
    before_action :check_admin
    #새로 만든 어드민 컨트롤러!
    #관리자 기능을 넣어 줄거예요
    def users
        @users = User.all
    end
    
    def change
        #해당하는 유저의 역할을 바꾼다
        # 1. 관리자면 양민으로
        # 2. 아니면 관리자로
        user = User.find(params[:id])
        if user.is_admin?
            user.update(
                is_admin?: false
                )
        else
            user.update(
                is_admin?: true
                )
        end
        redirect_to '/admin/users'
    end
    
    def check_admin
        unless current_user.is_admin?
        flash[:alert] = "양민 꺼져"
        redirect_to '/'
        end
    end
end
