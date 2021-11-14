require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'netflix_titles.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Title.new
    t.show_id = row['show_id']
    t.type = row['show_type']
    t.title = row['title']
    t.director = row['director']
    t.cast = row['cast']
    t.country = row['country']
    t.date_added = row['date_added']
    t.release_year = row['release_year']
    t.rating = row['rating']
    t.duration = row['duration']
    t.listed_in = row['listed_in']
    t.description = row['description']
  t.save
  puts "#{t.title},saved"
end

puts "There are now #{Title.count} rows in the transactions table"
