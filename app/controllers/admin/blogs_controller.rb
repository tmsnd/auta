class Admin::BlogsController < Admin::AdminController
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }  
end