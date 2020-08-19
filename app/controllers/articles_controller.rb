class ArticlesController < ApplicationController
    before_action :find_article, except: [:index, :new, :create]
    
    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create 
        @article = Article.create(article_params)

        if @article.save
            redirect_to articles_path
        else
            flash[:danger] = @article.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy 
        if @article.destroy
            redirect_to articles_path
        else
            render @article
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end

    def find_article
        @article = Article.find(params[:id])
    end
end
