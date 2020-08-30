class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/:id
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    1.times { @recipe.steps.build }
    1.times { @recipe.ingredients.build }

  end

  # POST /recipes
  def create
    #render plain: params[:recipe].inspect
    @recipe = Recipe.new(recipe_params)
    
    if(@recipe.save)
      redirect_to @recipe
    else
      render 'new'
    end
  end

  # GET /recipes/:id/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # PUT /recipes/:id
  def update
    @recipe = Recipe.find(params[:id])

    if(@recipe.update(recipe_params))
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end


  private def recipe_params
    params.require(:recipe).permit(:title, :prep_time, :cook_time, :servings, :origin, steps_attributes: [:id, :description, :sequence, :_destroy], ingredients_attributes: [:id, :item, :_destroy])
  end
end
