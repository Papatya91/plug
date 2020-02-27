require 'faker'

ArtistsTrack.destroy_all
puts "Artists_tracks Destroyed"
TracksUser.destroy_all
puts "TracksUsers Destroyed"
UsersEvent.destroy_all
puts "Users_events Destroyed"
Artist.destroy_all
puts "Artists Destroyed"
Track.destroy_all
puts "Tracks Destroyed"
Event.destroy_all
puts "Events Destroyed"
User.destroy_all
puts "Users Destroyed"

puts "Start Updating databse"
# location_choice = ["Impact Hub", "Lawson", "Maruetsu"]
# address_choice = ["Tokyo, Meguro City, Meguro, 2−11−3", "3 Chome-9-1 Meguro, Meguro City, Tokyo", "2 Chome-21-23 Shimomeguro, Meguro City, Tokyo"]
# artist_choice = ["Justin Bieber", "Drake", "Kaytranada"]

users = [
  {
    email: "grace@plug.com",
    password: "111111",
    refresh_token: "AQCmWGtUugm21ldmIHvJr9-MJA6-r48oUGE5I7LvUzKveBYGIS171EDlJqzm7g0hA0S-f7s5yeIYhmfBXYchhZv3hjgwpqO0MTdk5WIt1evmznXnTdD0nzOak1YHYLaT_aM",
    spotify_id: "1149899312",
    updated_at: "2020-02-20 11:28:40"
  },
  {
    email: "paula@plug.com",
    password: "111111",
    refresh_token: "AQCwcLA5HAJ9YbgA6BShEAiDgVr6Heo0zGH2QAuk01DH5ZkMwsjmvUbzGU85tUI3FxDjJw5s70KaSl5x3qoKglItb0nO6TdU3F3qyRxGUAswrGT8-3EhaXefgfnaI1SLRGg",
    spotify_id: "1149899312",
    updated_at: "2020-02-20 11:28:40"
  },
  {
    email: "tomo@plug.com",
    password: "111111",
    refresh_token: "AQA6r2BbAX3pQlmj_f6jnYjn6ovaIYkqVdJ46bSTHIeR22uVtPWjXKDL6kXNOZPLX33rJ8g4W3vIIsKNpc53DXYrezArzG_L80NOLgquTcsdspRsDtK3FCWcwXXJWr5b4XU",
    spotify_id: "1149899312",
    updated_at: "2020-02-20 11:28:40"
  }
]

users.each do |user|
  createdUser = User.create(user)
  RefreshTokenService.refresh_token(createdUser)
  FetchTracksService.downloadTracks(createdUser)
end

events = [
  {
    date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    venue: "UNIT",
    address: "Tokyo, Shibuya City, Ebisunishi, 1 Chome−34−17",
    artist: "Bob Moses",
    latitude: 35.647334,
    longitude: 139.702256
  },
    {
    date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    venue: "LIQUIDROOM",
    address: "Tokyo, Shibuya City, Higashi, 3 Chome-16-6",
    artist: "Carl Cox",
    latitude: 35.649383,
    longitude: 139.710553
  },
  {
    date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    venue: "The Room",
    address: "Tokyo, Shibuya City, Sakuragaokacho, 15−19",
    artist: "Emotional Oranges",
    latitude: 35.656655,
    longitude: 139.701640
  },
  {
    date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    venue: "SEL OCTAGON TOKYO",
    address: "Tokyo, Minato City, Roppongi, 7 Chome−8−6",
    artist: "FDVM",
    latitude: 35.665174,
    longitude: 139.729830
  },
  {
    date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    venue: "Billboard Live Tokyo",
    address: "Tokyo, Minato City, Akasaka, 9 Chome−7−4",
    artist: "GoldLink",
    latitude: 35.666687,
    longitude: 139.730918
  }
]

events.each do |event|
  new_event = Event.create(event)
  5.times do
    UsersEvent.create!(
      user: User.all.sample,
      event: new_event)
  end
  5.times do
    TracksUser.create!(
      event: new_event,
      user: new_event.users.sample,
      track: Track.all.sample)
  end
end
