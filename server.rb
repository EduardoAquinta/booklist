require 'sinatra'
require 'mongoid'

Mongoid.load! "mongoid.config"

class Book
    include Mongoid::Document

    field :title, type: String
    field :author, type: String
    field :isbn, type: String

    validates :title, presence: true
    validates :author, presence: true
    validates :isbn, presence: true

    index({ title: 'text'})
    index({ isbn:1}, {unique: true, name: "isbn_index"})
end

get '/' do
    'Welcome to Booklist'
end