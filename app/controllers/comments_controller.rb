class CommentsController < ApplicationController
    before_action :find_comment, only: [:edit, :update, :destroy]
    before_action :correct_user, except: [:new, :create, :destroy]

    def new
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build
    end

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to article_path(@comment.article)
        else
            flash[:danger] = @comment.errors.full_messages.to_sentence
            render :new
        end
    end

    def edit
        @article = @comment.article
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
        if current_user == @comment.user || current_user == @comment.article.user
            @comment.destroy

            redirect_to @comment.article
        else
            flash[:danger] = 'You dont have permission!'
            render @comment.article
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def correct_user
        unless current_user == @comment.user
            flash[:danger] = 'You dont have permission!'
            redirect_to @comment.article
        end
    end
end
