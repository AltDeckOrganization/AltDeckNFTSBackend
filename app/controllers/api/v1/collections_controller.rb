class Api::V1::CollectionsController < ApplicationController

    # GET /collections
    def index
        @collections = Collection.active_collections 
        render json: @collections
    end

    # GET /collections/:id
    def show 
        @collection = Collection.find(params[:id])
        render json: @collection
    end

    # POST /collections 
    def create 
        @collection = Collection.new(collection_params)
        @collection.active = false;
        if @collection.save
            render json: @collection
        else 
            render error: {error: 'Unable to create Collection. '}, status: 400
        end
    end

    # PUT /collections/:id
    def update
        @collection = Collection.find(params[:id])
        if @collection
            @collection.update(collection_params)
            render json: {message: 'Collection successfully updated' }, status: 200
        else
            render json: {error: 'Unable to update Collection.'}, status: 400
        end
    end

    # DELETE /collections/:id
    def destroy 
        @collection = Collection.find(params[:id])
        if @collection
            @collection.destroy
            render json: {message: 'Collections succesfully deleted'}, status: 200
        else
          render json: {error: 'Unable to delete collection'}, status: 400
        end                
    end

    private

    def collection_params
        params.permit(:name, :profile_image_path, :collection_image_path, :form_data)
    end


end
