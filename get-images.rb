require 'open-uri'

def save_image(url)
	fileName = File.basename(url)+ '.jpg'
  dirName = '/vagrant/wcp/rhapsody/app/assets/images/'
  filePath = dirName + fileName

  open(url) do |data|
    open(filePath, 'w+b') do |output|
      output.write(data.read)
    end
  end
end

url = "https://i.scdn.co/image/0701b17a8a6a729543049e8df5261a5355cdfea6"
save_image(url)
