xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Canvas Assignments"
    xml.description "This is where you can find course material."
    xml.link root_url

    @assignments.each do |assignment|
      xml.item do
        xml.title assignment['name']
        # xml.description assignment['description']
        xml.description 'This is a test'
        xml.pubDate assignment['created_at'].to_time.to_s(:rfc822)
        xml.link 'https://bba.instructure.com/courses/869'
        xml.guid 'https://bba.instructure.com/courses/869'
      end
    end
  end
end