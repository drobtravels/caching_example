## Caching with Ruby on Rails

This repository contains code examples for various ways of using caching with Ruby on Rails.

The code is from talk I gave titled "Real World Caching".  You can see the see the [slides here](http://www.slideshare.net/DavidRoberts38/real-world-caching-with-ruby-on-rails).

Availible Demos:

- [simple example of interacting with the Rails cache](https://github.com/droberts84/caching_example/blob/master/app/support/simple_cache_example.rb)
- Fragment Caching
  - [Simple / Naive demo](https://github.com/droberts84/caching_example/blob/master/app/views/posts/simple_cached_index.haml) at http://localhost:3000/posts/simple_cached_index
  - [Time based expiration](https://github.com/droberts84/caching_example/blob/master/app/views/posts/time_based_cache_index.haml) at http://localhost:3000/posts/time_based_cached_index
  - [Expiration based on Model changes](https://github.com/droberts84/caching_example/blob/master/app/views/posts/update_time_based_cache_index.haml) at http://localhost:3000/posts/update_time_based_cache_index
- Russian Doll Caching
  - [Multiple instances](https://github.com/droberts84/caching_example/blob/master/app/views/topics/index.haml) at http://localhost:3000/topics
  - [Single model instance](https://github.com/droberts84/caching_example/blob/master/app/views/topics/show.haml) at http://localhost:3000/topics
- [API example based on Model changes](https://github.com/droberts84/caching_example/blob/master/app/controllers/api_controller.rb#L4-L12) at http://localhost:3000/api/products.json
- [API example based on changes for multiple Models](https://github.com/droberts84/caching_example/blob/master/app/controllers/api_controller.rb#L28-L35) at http://localhost:3000/api/products_and_posts_by_date.json
- [Conditional GET example](https://github.com/droberts84/caching_example/blob/master/app/controllers/api_controller.rb#L18-L24) with clientside polling at http://localhost:3000/

### Running locally

    bundle install
    rake db:create && rake db:seed
    foreman start
    
### Redis Dependency

This requires Redis in development for caching.

On Mac OS, install with `brew install redis`

Run with `foreman start` to start both `redis-server` and `rails server`.
