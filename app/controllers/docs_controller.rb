class DocsController < ApplicationController

	before_action :doc_find, only: [:show,:edit,:update,:destroy]

	def index
		@docs = Doc.where(user_id: current_user).order(created_at: :desc)
	end

	def new
		@doc = current_user.docs.build
	end

	def create
		@doc = current_user.docs.build doc_params
		if @doc.save
			redirect_to @doc
		else
			render :new
		end		
	end

	def show
	end

	def edit
	end

	def update
		if @doc.update doc_params
			redirect_to @doc
		else
			render :edit
		end		
	end

	def destroy
		@doc.destroy
		redirect_to docs_path
	end

	private

	def doc_params
		params.require(:doc).permit(:titulo,:conteudo)
	end

	def doc_find
		@doc = Doc.find(params[:id])
	end
end
