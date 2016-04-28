FROM ubuntu:latest

RUN apt-get -q update
RUN apt-get -y install ruby rubygems git
RUN git clone https://github.com/luisbebop/docker-sinatra-hello-world.git /opt/sinatra/
RUN gem install bundler
EXPOSE 1881
RUN cd /opt/sinatra && git pull && bundle install
RUN bundle exec rake db:migrate
CMD ["bundle", "exec", "rackup"]