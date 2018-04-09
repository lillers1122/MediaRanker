class WorksController < ApplicationController
  def index
    @works = Work.all
    # where(category: "Book")
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: work_id)
  end

  def update
    @work = Work.find_by(id: work_id)
    if @work.update(work_params)
      redirect_to works_path
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :publication_year, :description)
  end

end
