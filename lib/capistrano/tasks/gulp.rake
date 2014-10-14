desc <<-DESC
    Run Gulp tasks. By default, it runs with no task specified, which \
    means the default Gulp task will be run. The install command is \
    executed with the --no-color flag.

    You can override any of these defaults by setting the variables shown below.

      set :gulp_executable, 'gulp'
      set :gulp_file, nil
      set :gulp_tasks, nil
      set :gulp_flags, '--no-color'
      set :gulp_target_path, nil
      set :gulp_roles, :all
DESC
task :gulp do
  on roles fetch(:gulp_roles) do
    within fetch(:gulp_target_path, release_path) do
      options = [
        fetch(:gulp_flags)
      ]

      options << "--gulpfile #{fetch(:gulp_file)}" if fetch(:gulp_file)
      options << fetch(:gulp_tasks) if fetch(:gulp_tasks)

      execute fetch(:gulp_executable), options
    end
  end
end

namespace :gulp do
  task default: :gulp
end

namespace :load do
  task :defaults do
    set :gulp_executable, 'gulp'
    set :gulp_file, nil
    set :gulp_tasks, nil
    set :gulp_flags, '--no-color'
    set :gulp_roles, :all
  end
end
