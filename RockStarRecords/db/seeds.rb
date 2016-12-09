# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
emails = ['the@one.com', 'the@two.com', 'the@three.com']
emails.length.times do |i|
  User.create(email: emails[i], password: "#{i}" * 6)
end
bands = ['The Skittles', 'The Spiders', "Cool Child"]
bands.length.times do |j|
  b = Band.create(name: bands[j])
  albums = ["first", "second", "third", "fourth"]
  album_names = albums.map { |al| bands[j] + " " + al }
  album_names.each do |k|
    a = Album.create(band_id: b.id, title: k, scene: 'studio')

    tracks = %w{one two three four five}
    tracks.each do |m|
      Track.create(album_id: a.id, title: m, status: 'regular')
    end
  end
end
