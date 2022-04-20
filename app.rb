require './console'
require './label'
require './book'

class App
  include Console
  def initialize
    @books = []
    @labels = []
  end
end
