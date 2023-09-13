class PostsController < ApplicationController
    def index
        @title = 'Первая страничка на ruby'
        @site_posts = SitePost.all
    end
    
    def show
        @title = "Страничка для просмотра одного поста"
        @site_post = SitePost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @site_post = SitePost.new()
    end

    def create
        @site_post = SitePost.new(site_post_params)
        if @site_post.save
            redirect_to @site_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @site_post = SitePost.find(params[:id])        
    end     

    def update
        @site_post = SitePost.find(params[:id])
        if @site_post.update(site_post_params)
            redirect_to @site_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def site_post_params
        params.require(:site_post).permit(:title, :body) 

    end
end
