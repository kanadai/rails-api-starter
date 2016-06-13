#Rails Api Starter

注：APIのDocumentが不要な場合は6,7は不要です。`config/application.rb`を変更して下さい。

####1.Ruby version

    3.5.1  
  
####2.Getting started

    bundle install --path vendor/bundle

####3.Edit database.yml

    Change username & password
  
####4.Database creation

    bin/rake db:migrate

    Or

    bin/rake db:drop db:create db:migrate

####5.Use scaffold if you need

    bin/rails g scaffold #{model name} #{key}:#{type}

####6.Fill out the resource schema

    bundle exec prmd init --yaml user > docs/schema/yml/user.yml

####7.Make Docs

    bundle exec prmd combine doc/schema/yml/user.yml > doc/schema/json/user.json
    bundle exec prmd doc doc/schema/json/user.json > doc/user.md
    
*OR After test*

    bundle exec prmd doc doc/schema/schema.json > doc/schema.md

####8.How to run the test suite

    bin/rspec $PATH/#{model name}_spec.rb

####9.Run auto test

    guard  
  
