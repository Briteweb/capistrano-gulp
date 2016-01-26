# Capistrano::Gulp

This gem will let you run [Gulp](http://gulpjs.com/) tasks with Capistrano 3.x.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'capistrano', '~> 3.0'
gem 'capistrano-gulp', "~> 0.0.2"
```

And then execute:

```
$ bundle install
```

2. Add to `Capfile` or `config/deploy.rb`:

```ruby
require 'capistrano/gulp'
```

## Usage

Set what Gulp tasks you want run in your `deploy.rb` file:

```ruby
set :gulp_tasks, 'deploy:production'
```

If you don't set `:gulp_tasks`, Gulp will run without any task specified. (equivalent to just running `gulp` from the command line).

To run multiple tasks (can be string or array of strings):

```ruby
set :gulp_tasks, 'deploy:production cdn'
set :gulp_tasks, %w{deploy:production cdn}
```

The above would be equivalent of running the following from the command line:

```bash
gulp deploy:production cdn
```

Then add the task to your `deploy.rb`:

```ruby
namespace :deploy do
  before :updated, 'gulp'
end
```

## Configuration

To specify a `Gulpfile`, use the `:gulp_file` option:

```ruby
set :gulp_file, -> { release_path.join('config/Gulpfile.js') }
```

Configurable options:

```ruby
set :gulp_file, nil                                       # default
set :gulp_tasks, nil                                      # default
set :gulp_flags, '--no-color'                             # default
set :gulp_roles, :all                                     # default
set :gulp_target_path, -> { release_path.join('subdir') } # default not set
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
