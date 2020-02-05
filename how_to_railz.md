rails active_storage:install

rails db:migrate

modify -> config/storage.yml <- specify (public: true)

to use amazon s3 add to gemfile -> gem "aws-sdk-s3", require: false

Add "has_many_attached :photos" to class.rb
class User < ApplicationRecord
  has_many_attached :photos
end

Add file_field in form in views
<%= form.file_field :photos %>

Add params to classController
class SignupController < ApplicationController
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end
  private
    def user_params
      params.require(:user).permit(:email_address, :password, photos: [])
    end
end

inside controller call -> photos.attach
user.photos.attach(params[:photos])

add this to the show view:
<% if @spot.photos.attached?%>
<% @spot.photos.each do |photo| %>
<%= image_tag(photo)%>
<% end %>
<% else %>
  <p>No photos for this product.</p>
<% end %>

Include activestorage.js in JavaScript bundle.
using assist pipeline -> //= require activestorage

Change file_field in form
<%= form.file_field :attachments, multiple: true, direct_upload: true %>

Configure CORS on third-party storage services to allow direct upload requests.

https://edgeguides.rubyonrails.org/active_storage_overview.html
