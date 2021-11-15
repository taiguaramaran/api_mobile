class TitlesImporter
  require 'csv'
  def self.call!(file)
    new(file).run!
  end

  def run!
    CSV.foreach(@file.path, headers: ['show_id', 'show_type', 'title','director','cast','country','date_added',
                                      'release_year','rating','duration','listed_in','description']) do |row|
      if row['show_id'] != 'show_id'
        Title.where(show_id: row['show_id']).first_or_create(row.to_hash)
      end
    end
  end

  private

  def initialize(file)
    @file = file
  end
end
