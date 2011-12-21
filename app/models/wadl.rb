require 'nokogiri'

class Wadl < ActiveRecord::Base
  has_attached_file :wadlfile
  validates_attachment_presence :wadlfile
  validates_attachment_content_type :wadlfile, :content_type =>'application/octet-stream'
  has_many :resources, :foreign_key => "wadl_id"
  
  def quick_load
    print "HERE in quick load-----\n"
    print self.wadlfile.path
    print "\n"
    doc = Nokogiri::XML(open(self.wadlfile.path))
    print "about to loop. Doc:\n"    
    print "\n"
    doc.xpath("resources").each do |resource|
      print "looping\n"
      print resource['path']
    end
  end 
end
