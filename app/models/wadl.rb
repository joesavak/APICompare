require 'nokogiri'

class Wadl < ActiveRecord::Base
  has_attached_file :wadlfile
  validates_attachment_presence :wadlfile
  validates_attachment_content_type :wadlfile, :content_type =>'application/octet-stream'
  has_many :resources, :foreign_key => "wadl_id"
  
  def quick_load
    print "----HERE in quick load-----\n"
    print self.wadlfile.path
    print "\n"
    
    @doc = Nokogiri::XML(File.open(self.wadlfile.path))
    print "----Opened doc----\n"
    print "----Searching doc-----\n"
    @doc.css("resource").each do |resource|
      resource.css("resource").each do |res2|
        res2.css("method").each do |meth2| 

           
          if res2['path'] != "{alias}"
            print "resource path: " + resource['path'] + res2['path'] + "  method: " + meth2['href'] + "\n"
            re = Resource.new
            re.wadl_id = self.id
            re.name = meth2['href']
            re.base_url = resource['path'] + res2['path'] 
            re.save!
          end
          
        end 
      end
    end
  end 
end
