module RecipesHelper  
  # total cook + prep time
  def total_time(recipe)
     recipe.prep_time + recipe.cook_time
  end

  # get full country name 
  def country_name(origin)
      country = ISO3166::Country[origin]
      country.translations[I18n.locale.to_s] || country.name
  end

  # display n/a if no origin
  def originOrNo(recipe)
    if (recipe.origin.present?) 
      country_name(recipe.origin)
    else
     "N/A"
    end
  end

end

