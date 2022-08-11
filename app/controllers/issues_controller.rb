class IssuesController < ApplicationController
  def index
    @issue = Issue.all
    render json: @issue
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      render json: @issue
    else
      render json: @issue.errors
    end
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    if @issue.destroy
      head :no_content, status: :ok
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:name)
  end
end
