
class App < Sinatra::Base
  get "/" do
    File.read("gen/slides.html")
  end
end
