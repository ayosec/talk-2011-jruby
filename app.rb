
Content = File.read("#{File.dirname(__FILE__)}/gen/slides.html")

class App < Sinatra::Base
  get "/" do
    Content
  end
end
