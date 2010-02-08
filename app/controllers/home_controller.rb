class HomeController < ApplicationController
  def index
    @accounts = Account.find(:all, :conditions => {'manager_id' => current_user.id})
  end

end
