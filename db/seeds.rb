Notification.destroy_all
Video.destroy_all
Project.destroy_all
Client.destroy_all
Pm.destroy_all
VideoType.destroy_all

pm1 = Pm.create!(name: "Usama saleem", email: "usama@example.com")
pm2 = Pm.create!(name: "Matias", email: "matias@example.com")

Client.create!(name: "Client A", email: "clienta@example.com", pm: pm1)
Client.create!(name: "Client B", email: "clientb@example.com", pm: pm2)
Client.create!(name: "Client C", email: "clientc@example.com", pm: pm1)

VideoType.create!(name: "Highlight Reel", price: 120.0, format: "mp4")
VideoType.create!(name: "Teaser Clip", price: 75.0, format: "mp4")
VideoType.create!(name: "Full Documentary", price: 250.0, format: "mp4")
