set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake db:migrate
