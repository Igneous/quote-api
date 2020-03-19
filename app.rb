#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'

before do
  @quotes = File.read('quotes.txt')
                .split("\r\n\r\n")
end

get '/quote' do
  @quotes.sample
end

get '/quote/:num' do |quote_num|
  @quotes[quote_num.to_i]
end
