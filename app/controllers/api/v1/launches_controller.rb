class Api::V1::LaunchesController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show, :create]
    LaunchResponse = Struct.new('LaunchResponse',:image, :name, :price, :tokens, :date, :filled, :status, :link)

     # GET /launches
    def index
        @launches = Launch.all.where(status: :active)
        render json: @launches, except: [:form_data]
        @launches = Launch.all
        launchResponses = [];
        
        for launch in @launches do
           form_info = JSON.parse launch.form_data
           col_data = LaunchResponse.new(launch.profile_image_path, launch.name, form_info['social_info']['mintPrice'], form_info['social_info']['supplyCount'], form_info['social_info']['mintDate'], form_info['social_info']['mintTime'], launch.status, "mintpage/" + launch.id.to_s)
           launchResponses.push(col_data)
        end

        render json: launchResponses
    end

    # GET /launches/:id
    def show 
        @launch = Launch.find(params[:id])
        render json: @launch, except: [:collection_image_path]
    end

    # POST /launches 
    def create 
        @launch = Launch.new(launch_params)
        @launch.status = :disabled;
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

        def admin_launch_params 
            params.permit(:name, :profile_image_path, :collection_image_path, :form_data, :candymachine_id, :page_data)
        end
end
