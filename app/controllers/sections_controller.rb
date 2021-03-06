class SectionsController < ApplicationController
 
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @sections = Section.order("sections.position ASC")
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created."
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated."
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed."
    redirect_to(:action => 'list')
  end
  
   private
  def section_params
    params.require(:section).permit(:page_id, :name,:position, :visible, :content_type, :content)
  end
end
