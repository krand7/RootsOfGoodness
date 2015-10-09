class StaticController < ApplicationController
  def home
    @active_link = 'home'
  end

  def faqs
  end

  def privacy
  end

  def about
    @active_link = 'about'
  end

  def team
  end
end
