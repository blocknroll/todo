class TasksController < ApplicationController

	attr_accessor :completed

	respond_to :html, :xml, :js


	def create
		@list = List.find(params[:list_id])
		@task = @list.tasks.new(params[:task])
		if @task.save
			flash[:notice] = "task created"
			redirect_to list_url(@list)
		else
			flash[:error] = "Couldn't, sorry"
			redirect_to list_url(@list)
		end
	end


	def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		redirect_to list_url(@list)
	end

end
