module PhotosHelper
  def exif_data(photo)
    exif = []
    exif << photo.camera if photo.camera && !photo.camera.empty?
    exif << photo.focal_length if photo.focal_length && !photo.focal_length.empty?
    exif << "ISO #{photo.iso}" if photo.iso && !photo.iso.empty?
    exif << "F/#{photo.aperture}" if photo.aperture && !photo.aperture.empty? && !photo.aperture == 0
    exif << photo.exposure if photo.exposure && !photo.exposure.empty?
    exif << photo.taken.strftime('%B %d, %Y')
    exif.join(' : ')
  end
end
