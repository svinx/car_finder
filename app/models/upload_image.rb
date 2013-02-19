class UploadImage

  def transfer(image, vin)
    Cloudinary::Uploader.upload(image, :public_id => vin, :width => 300, :height => 300, :crop => :fill)
    #full 61kb
  end

end
