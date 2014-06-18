class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = getArticle
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article '#{@article.title}' created!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = getArticle
		@article.destroy
		flash.notice = "Article '#{@article.title}' deleted!"
		redirect_to articles_path
	end

	def edit
		@article = getArticle
	end

	def update
		@article = getArticle
		@article.update(article_params)
		flash.notice = "Article '#{@article.title}' Updated!"
		redirect_to article_path(@article)
	end

	def getArticle
		Article.find(params[:id])
	end


end
