# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.all if user_signed_in?
  end
end
