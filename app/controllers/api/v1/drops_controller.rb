class Api::V1::DropsController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :create, :show]

    # GET /drops
    def index 
        @drops = Drop.all
        render json: @drops, except: [:form_data]
    end

    # GET /drops/:id
    def show 
        @drop = Drop.find(params[:id])
        render json: @drop
    end

    # POST /drops 
    def create 
        @drop = Drop.new(drop_params)
        @drop.status = :disabled;
        if @drop.save
            render json: @drop
        else 
            render error: {error: 'Unable to create Launch. '}, status: 400
        end
    end

    # PUT /drops/:id
    def update
        @drop = Launch.find(params[:id])
        if @drop
            @drop.update(admin_drop_params)
            render json: {message: 'Drop successfully updated' }, status: 200
        else
            render json: {error: 'Unable to update Drop.'}, status: 400
        end
    end

    # DELETE /drops/:id
    def destroy 
        @drop = Drop.find(params[:id])
        if @drop
            @drop.destroy
            render json: {message: 'drops succesfully deleted'}, status: 200
        else
          render json: {error: 'Unable to delete drop'}, status: 400
        end                
    end

    def get_admin_drops_info
        @drops = Drop.all
        render json: @drops, except: [:profile_image_path]
    end

    private

        def drop_params
            params.permit(:name, :profile_image_path, :form_data)
        end

        def status_params
            params.permit(:status)
        end

end
