class ArticlesController  < ApplicationController

    def show
        #debugger
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        #respond_to do |format|
        #format.turbo_stream { render plain: params[:article] }
        #end
        if @article.save
            flash[notice:] = 'Article was successfully created.'
            redirect_to @article
        else
            render :new
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[notice:] = 'Article was successfully created.'
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

end