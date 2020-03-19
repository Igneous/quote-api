#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'json'

before do
  @quotes = File.read('quotes.txt')
                .split("\r\n\r\n")
end

get '/quote' do
  @quotes.sample.to_json
end

get '/quote/:num' do |quote_num|
  @quotes[quote_num.to_i].to_json
end

get '/authors' do
  @quotes.map { |q| q.split('--').last }.sort.uniq.to_json
end

get '/authors/:num' do |author_num|
  @quotes.map { |q| q.split('--').last }.sort.uniq[author_num].to_json
end
