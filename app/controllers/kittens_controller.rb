class KittensController < ApplicationController

def index
	@kittens = Kitten.all
	respond_to do |format|
		format.html
		format.json {render :json => @kittens}
	end
end

def show
	@kitten = Kitten.find(params[:id])
	respond_to do |format|
		format.html
		format.json {render :json => @kitten}
	end
end

def new
	@kitten = Kitten.new
end

def create 
	@kitten = Kitten.new(kitty_params)
	if @kitten.save 
		flash[:notice] = "New Kitty Added"
		redirect_to @kitten
	else
		render "new"
	end
end

def edit
	@kitten = Kitten.find(params[:id])
end

def update
	@kitten = Kitten.find(params[:id])
	if @kitten.update_attributes(kitty_params)
		flash[:notice] = "Updated Kitty"
		redirect_to @kitten 
	else
		render "edit"
	end
end



private 
def kitty_params
	params.require(:kitten).permit(:name,:age,:cuteness,:softness)
end
end 