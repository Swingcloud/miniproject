atom_feed do |feed|
  feed.title( @feed_title )
  feed.updated( @musics.last.created_at )
  @musics.each do |music|
    feed.entry(music) do |entry|
      entry.title( music.name )
      entry.content( music.introduction, :type => 'html' )
    end
  end
end