# require 'oci8'

$oci

class ServiceIntegration< AddPayeeReq

	@headerservice=0
	@addpaybody=0

def initialize

	@headerservice = HeaderService.new
	@addpaybody=AddPayeeReq.new
	@validatepayee=ValidatePayeeReq.new

end


def get_message (custid,custName,segcode,custType,isStaff,phNo,email,date,channel,cntry,lang,sessid,org,ver,partName,partType,sname,sTType,hostenv,reqId,payeeid,pNickname,pName,consumerno,status,lUPDate,pmobile,pemail,bCatID,bCatName,bID,bName,preName,defaultAmt,tTypeCod,bMinAmt,bMaxAmt)

@headerservice = HeaderService.new
# puts @headerservice.get_usercontext(custid,custName,segcode,custType)
puts @headerservice.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partType,partName)
puts @headerservice.get_serviceContext(sname, sTType)
puts @headerservice.get_messageContext(reqId)
puts @headerservice.get_CustContactDetails(phNo,email)
cNo=consumerno
payeeName=pName
puts "Consumer number recieved from impl file" 
puts cNo

puts "in addpayeereq of get_method"
	con=@addpaybody.consumer(cNo)
	puts con
	plimits=@addpaybody.payLimits(tTypeCod,bMinAmt,bMaxAmt)
	puts plimits
	bdets=@addpaybody.billerdetails(bCatID,bCatName,bID,bName,preName,defaultAmt,plimits)
	puts bdets
	custCon=@headerservice.get_CustContactDetails(phNo,email)


@message = {
	"pay:UserContext"=> @headerservice.get_usercontext(custid,custName,segcode,custType,isStaff,custCon),
	"pay:ClientContext" => @headerservice.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partName,partType), 
	"pay:ServiceContext" => @headerservice.get_serviceContext(sname, sTType),
	"pay:MessageContext" => @headerservice.get_messageContext(reqId),
	"pay:PayeeDetails" => payeedetails(payeeid,pNickname,con,status,lUPDate,pmobile,pemail,bdets),
	
}


puts  "in addPayee request class"

return @message
end


# puts "End of the class AddPayeeReq"
# puts "============================="
# # puts ServiceIntegration.new.get_message(consumerno)

def get_message1 (custid,custName,segcode,custType,isStaff,phNo,email,date,channel,cntry,lang,sessid,org,ver,partName,partType,sname,sTType,hostenv,reqId,payeeId, payeeNickname, payeeName, consNo, billerID, payAmt, payCur, sofund)

@headerservice1 = HeaderService.new
# puts @headerservice.get_usercontext(custid,custName,segcode,custType)
puts @headerservice1.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partType,partName)
puts @headerservice1.get_serviceContext(sname, sTType)
puts @headerservice1.get_messageContext(reqId)
custCon= @headerservice1.get_CustContactDetails(phNo,email)
puts custCon
cNo=consNo
payeeName=payeeName
puts "Consumer number recieved from impl file" 
puts cNo

puts "In validate payee req of get_mathod"
	payeedet=@validatepayee.payeeDetails(payeeId, payeeNickname, payeeName, consNo, billerID, payAmt, payCur, sofund)
	puts payeedet

@message1 = {
	"pay:UserContext"=> @headerservice.get_usercontext(custid,custName,segcode,custType,isStaff,custCon),
	"pay:ClientContext" => @headerservice.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partName,partType), 
	"pay:ServiceContext" => @headerservice.get_serviceContext(sname, sTType),
	"pay:MessageContext" => @headerservice.get_messageContext(reqId),
	"pay:PayeeRequest" => @validatepayee.payeeDetails(payeeId, payeeNickname, payeeName, consNo, billerID, payAmt, payCur, sofund)
}


puts  "in validate payee request class"

return @message1
end



def fileWriting(scNo,fileName,req_res)
	
	dir = File.dirname(fileName)
	# dir = DIR.chdir("C:\Anandhi\Automation\Alipay_Servicetesting\Request_Response")
	puts dir
	base=File.basename(fileName)
	time=Time.now.to_i
	puts time
	extn='.xml'
	scNo=scNo
	
	tempfile1 = File.join(dir, "#{scNo}_#{base}_#{time}")
	file_name=tempfile1 + extn
			
			afile=File.open(file_name, "a+") 
			afile.write(req_res)

			
end

def writeToFile(filename,content)
	dir = File.dirname(filename)
	base = File.basename(filename)
	extn = '.txt'
	fileName = filename + extn
	afile=File.open(fileName, "a")
	afile.write(content)
end


def connectingOracle(custid,nickname,consumerNo)

		$oci=OCI8.new('SRMAPP','SRMAPP_123','RPE_SIT')

		query="select * from Srm_Payments_Sit01.Bill_Payee_Details where country_code='HK' and CUSTOMER_ID='#{custid}' and PAYEE_SHORTNAME='#{nickname}' and consumer_no='#{consumerNo}'"

		return query
end

def getHeaderMessage (custid,custName,segcode,custType,isStaff,phNo,email,date,channel,cntry,lang,sessid,org,ver,partName,partType,sname,sTType,hostenv,reqId)

@headerservice = HeaderService.new
# puts @headerservice.get_usercontext(custid,custName,segcode,custType)
puts @headerservice.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partType,partName)
puts @headerservice.get_serviceContext(sname, sTType)
puts @headerservice.get_messageContext(reqId)
puts @headerservice.get_CustContactDetails(phNo,email)
custCon=@headerservice.get_CustContactDetails(phNo,email)



@headermessage = {
	"pay:UserContext"=> @headerservice.get_usercontext(custid,custName,segcode,custType,isStaff,custCon),
	"pay:ClientContext" => @headerservice.get_clientContext(date,channel,cntry,lang,org,ver,sessid,partName,partType), 
	"pay:ServiceContext" => @headerservice.get_serviceContext(sname, sTType),
	"pay:MessageContext" => @headerservice.get_messageContext(reqId),
	}
return @headermessage

end

def getPayeerecord_count(custid)
	$oci=OCI8.new('SRMAPP','SRMAPP_123','RPE_SIT')
	countdetails= "select * from Srm_Payments_Sit01.Bill_Payee_Details where country_code='HK' and CUSTOMER_ID='#{custid}'"

	return countdetails
end
 end