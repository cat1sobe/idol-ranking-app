#baseimage、rubyをインストールする
FROM ruby:3.0.0

#Linuxなどで用いられるパッケージ管理ツール、最新情報にアップデートする
RUN apt-get update -qq && apt-get install -y build-essential

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



