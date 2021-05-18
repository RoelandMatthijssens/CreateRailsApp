require File.expand_path('./environment', __dir__)

lock '~> 3.16.0'

set :application, 'createRailsApp'
set :repo_url, 'git@github.com:RoelandMatthijssens/createRailsApp.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.4.2'

set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl bundler]
set :rbenv_roles, :all

set :linked_files, %w[config/master.key config/database.yml]

before 'deploy:assets:precompile', 'deploy:yarn_install'
namespace :deploy do
  desc 'Run rake yarn:install'
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end
