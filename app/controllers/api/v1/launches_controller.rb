class Api::V1::LaunchesController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show, :create]

     # GET /launches
    def index
        @launches = Launch.all.where(status: :active)
        render json: @launches, except: [:form_data]
    end

    # GET /launches/:id
    def show 
        @launch = Launch.find(params[:id])
        render json: @launch
    end

    # POST /launches 
    def create 
        @launch = Launch.new(launch_params)
        @launch.active = false;
        if @launch.save
            render json: @launch
        else 
            render error: {error: 'Unable to create Launch. '}, status: 400
        end
    end

    # PUT /launches/:id
    def update
        @launch = Launch.find(params[:id])
        if @launch
            @launch.update(admin_launch_params)
            render json: {message: 'Launch successfully updated' }, status: 200
        else
            render json: {error: 'Unable to update Launch.'}, status: 400
        end
    end

    # DELETE /launches/:id
    def destroy 
        @launch = Launch.find(params[:id])
        if @launch
            @launch.destroy
            render json: {message: 'launches succesfully deleted'}, status: 200
        else
          render json: {error: 'Unable to delete launch'}, status: 400
        end                
    end

    def get_admin_launches_info
        @launches = Launch.all
        render json: @launches, except: [:profile_image_path, :collection_image_path]
    end 

    # Change launch status
    def change_launch_status
        @launch = Launch.find(params[:id])
        if @launch
            @launch.update(status_params)
            render json: {message: 'Launch status successfully updated' }, status: 200
        else
            render json: {error: 'Unable to update Launch status'}, status: 400
        end
    end

    private

        def launch_params
            params.permit(:name, :profile_image_path, :collection_image_path, :form_data, :candymachine_id, :status)
        end

        def status_params
            params.permit(:status)
        end
end
