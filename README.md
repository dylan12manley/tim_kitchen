# Tim Kitchen
_This is an application made to view, create update and delete products to a food library. Users can add reviews to the products as well. It uses Ruby, Rails and SQL_
By Dylan Manley

## Setup Instructions

* Open your termial
* Enter "git clone https://github.com/dylan12manley/tim_kitchen.git" in the terminal
* Enter "cd tim_kitchen" in the terminal
* Enter "bundle" in the terminal
* Enter "rails s" in the terminal
* Open your browser
* Visit "localhost:3000" in your browser

## Known Bugs

## Support and contact details
_Any questions, comments or contributions please contact Dylan Manley (dylan.manley@gmail.com)_

## Technologies Used
Ruby, Rails, pSQL, HTML, CSS

## License
*The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.*

Copyright (c) 2020 Dylan Manley

dylan.manley@gmail.com

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
