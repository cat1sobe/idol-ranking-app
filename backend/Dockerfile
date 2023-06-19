#baseimage、rubyをインストールする
FROM ruby:3.0.0

#Linuxなどで用いられるパッケージ管理ツール、最新情報にアップデートする
RUN apt-get update -qq && \
  apt-get install -y build-essential \
  sudo \
  nginx

# # #docker上のcredentialsファイルを編集するため
RUN apt-get install -y vim

RUN mkdir /app
WORKDIR /app

#GemfileをDocker環境にCOPYする（＊ADDはURLアクセスや解凍機能があるが、Gemfileに関しては不要と判断）
COPY Gemfile /app/Gemfile

RUN gem update --system \
 && gem install bundler:2.2.3 \
  && bundle config set force_ruby_platform true

RUN bundle install


#Dockerイメージとローカルとを紐付ける
ADD . /app

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf

#コンテナがポート80でリクエストの待受が可能にする
EXPOSE 80

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]



