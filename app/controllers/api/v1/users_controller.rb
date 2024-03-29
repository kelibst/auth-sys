module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]
      before_action :authenticate_user, except: [:create]
      

      # GET /users
      # GET /users.json
      def index
        @users = User.all
      end

      # GET /users/1
      # GET /users/1.json
      def show; end

      # def user_favorites
      #   @houses = House.all
      #   @user_fav = @user.user_favs(@user, @houses)
      # end

      # POST /users
      # POST /users.json
      def create
        @user = User.new(user_params)
        if @user.save
          setToken
          UserNotifierMailer.send_signup_email(@user).deliver
          render :show, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      def update
        if current__user.isAdmin || current__user == @user
          if @user.update(user_update_params)
          #   setToken
          # UserNotifierMailer.send_signup_email(@user).deliver
            render :show, status: :ok
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          render json: 'Sorry you are not allowed to perform this operation.', status: :unprocessable_entity
        end
      end

      def find_user
        @user = User.find_by!(username: params[:username])
        if @user
          render :show, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1.json
      def destroy
        if current__user.isAdmin
          @user.destroy
        else
          render json: 'Sorry you are not allowed to perform this operation.', status: :unprocessable_entity
        end
      end

      def confirm_email
        @user = User.find_by!(confirm_token: params[:id])
        if @user 
          @user.verified = true
          @user.confirm_token = nil
          @user.save!
          render :show, status: :ok
        else 
          render json: 'Sorry you are not allowed to perform this operation.', status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      def setToken
        if @user.confirm_token.blank?
          @user.confirm_token = SecureRandom.urlsafe_base64.to_s
          @user.save!
      end
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username,
                                     :email, 
                                     :password,
                                     :password_confirmation,
                                     :firstname,
                                     :lastname,)
      end

      def user_update_params
        params.require(:user).permit(:username,
                                     :firstname,
                                     :lastname,)
      end
    end
  end
end
