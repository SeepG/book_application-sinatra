require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'app/public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home
  end

  get '/books/new' do
    erb :new
  end

  post '/books' do
    @book = Book.new
    @book.title = params[:title]
    @book.author = params[:author]
    @book.genre = params[:genre]
    @book.save

    redirect '/books'
  end

  get '/books/:id' do
    id = params[:id]
    @book = Book.find(id)

    erb :show
  end

  get '/books' do
    @books = Book.all

    erb :index
  end

  get '/books/:id/edit' do
    id = params[:id]
    @book = Book.find(id)

    erb :edit
  end

  patch '/books/:id' do
    id = params[:id]
    title = params[:title]
    author = params[:author]
    genre = params[:genre]

    @book = Book.find(params[:id])
    @book.update(title: title, author: author, genre: genre)

    redirect "/books/#{@book.id}"
  end

  delete '/books/:id' do
    id = params[:id]

    @book = Book.find(id)
    @book.destroy

    erb :delete
  end
end
