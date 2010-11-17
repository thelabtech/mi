require 'vpim/vcard'
 
class VcardsController < ApplicationController
  def show
   	@person = Person.find(params[:id])
 
  	card = Vpim::Vcard::Maker.make2 do |maker|
 
  		maker.add_name do |name|
        name.prefix = @person.title.to_s
        name.given = @person.nickname
        name.family = @person.lastName
        name.additional = @person.firstName if @person.nickname != @person.firstName
  		end
    
      if address = @person.current_address
    		maker.add_addr do |addr|
    			addr.preferred = true
    			addr.location = 'home'
          streets = [address.address1, address.address2, address.address3, address.address4].compact!
          streets.reject! {|s| s.blank?}
          addr.street = streets.join(', ')
          addr.locality = address.city.to_s
          addr.region = address.state.to_s
          addr.postalcode = address.zip.to_s
          addr.country = address.country.to_s
    		end
  		
 
    		maker.add_tel(address.homePhone) { |e| e.location = 'home' } if address.homePhone.present?
    		maker.add_tel(address.workPhone) { |e| e.location = 'work' } if address.workPhone.present?
    		maker.add_tel(address.cellPhone) { |e| e.location = 'cell' } if address.cellPhone.present?
 
    		maker.add_email(address.email) { |e| e.location = 'work' }
    	end
  	end
  	send_data card.to_s, :filename => "contact.vcf"	
  end
end