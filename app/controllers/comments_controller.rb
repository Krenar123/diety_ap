class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :find_comment, only: [:edit, :update, :destroy]
    
    def index
        @article = Article.find(params[:article_id])
        @comment = @article.comments
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)

        if @comment.save
            redirect_to article_path(@comment.article)
        else
            flash[:danger] = @comment.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to article_path(@comment.article)
        else
            flash[:danger] = @comment.errors.full_messages.to_sentence
            render :edit
        end
    end

    def destroy
        @comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
