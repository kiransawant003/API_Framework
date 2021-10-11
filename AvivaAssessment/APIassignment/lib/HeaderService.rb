require 'rubygems'
require 'savon'

class HeaderService

# @wsdl_location = 'https://10.20.161.31:3002/globalPaymentServiceWeb/services/paymentservice?wsdl'
#  $client=Savon::Client.new(wsdl: @wsdl_location,namespaces: {"xmlns:pay" =>"http://www.scb.com/channels/Paymentservice", "xmlns:com" =>"http://www.scb.com/channels/common"}, convert_request_keys_to: :none, ssl_verify_mode: :none,env_namespace: :soapenv, namespace_identifier: :pay, log: true, pretty_print_xml: true)

def get_CustContactDetails(phone,email)

@custContact = {
"com:Phone" => phone,
"com:Email" => email
}
end

def get_usercontext (custid,custName,segcode,custType,isStaf,custContact)
	@usercontext = {

	# "com:CustomerId" => "000004425",
	# "com:CustName" => "DEV",
	# "com:SegmentCode" => "10",
	# "com:CustomerType" => "R"

	"com:CustomerId" => custid,
	"com:CustName" => custName,
	"com:SegmentCode" => segcode,
	"com:CustomerType" => custType,
	"com:isStaff" => isStaf,
	"com:ContactDetails" => custContact

}
end

def get_clientContext(date,channel,cntry,lang,org,ver,sesid,partnerName,partnerType)
	@clientContext = {
	# "com:Date" => "2016-08-22T14:04:08.016+08:00",
	# "com:Channel" => "IBNK",
	# "com:Country" => "KE",
	# "com:Language" => "en",
	# "com:Org" => "TEST ORG",
	# "com:Version" => "TEST VERSION",
	# "com:SessionId" => "TEST SESSION"

	"com:Date" => date,
	"com:Channel" => channel,
	"com:Country" => cntry,
	"com:Language" => lang,
	"com:Org" => org,
	"com:Version" => ver,
	"com:SessionId" => sesid,
	"com:PartnerName" => partnerName,
	"com:PartnerType" => partnerType
}
end
def get_serviceContext(sName,sTxnType)

@serviceContext ={
	"com:ServiceName" => sName,
	"com:ServiceTxnType" => sTxnType

	# "com:ServiceName" => "TEST SERVICE",
	# "com:ServiceTxnType" => "q"
}

end
def get_messageContext(reqid)
@messageContext = {"com:ReqID" => reqid}
# @messageContext = {"com:ReqID" => "12345678"}
end
end

module HeaderAttributes
	def header_Attr(custID,custName,segCode,custType,isStaff,phNo,eMail,date,channel,cntry,lang,sessID,org,version,partName,partType,serName,serTxnType,hostEnv,reqID)
		puts "Hi"
		@customerid = custID
		@custname=custName
		@segcode=segCode
		@custType=custType
		@isStaff=isStaff
		@phNo=phNo
		@eMail=eMail
		@date=date
		@channel=channel
		@cntry=cntry
		@lang=lang
		@sessionid=sessID
		@org=org
		@version=version
		@partName=partName
		@partType=partType
		@SerName=serName
		@serTType=serTxnType
		@HostEnv=hostEnv
		@req = reqID
		puts "#{@customerid}"
	end
end

# def get_PayLimit
# @payLimit = {
# 	"com:TxnTypeCd" => "1",
# 	"com:BillerMinPmt" => "10",
# 	"com:BillerMaxPmt" => "10000",

# }

# def get_Biller_Details

# @billerDetails = {"com:BillerCategoryId" => "152",
# 	"com:BillerCategoryName" => "AIRTIME",
# 	"com:BillerId" => "KECSCSSAFCOMKE",
# 	"com:BillerName" => "SAFARICOM",
# 	"com:presentmentType" => "1",
# 	"com:defaultAmount" => "1",
# 	"com:PayLimit" => payLimit
# }
# end

# def get_Consumer_Details
# @consumer = {
# 	"com:ConsumerNo" => "1526009"
# }
# end

# def get_Payee_Details
# payeeDetails = {
# 	"pay:PayeeId" => "100",
# 	"pay:PayeeNickname" => "HareshPHCN Arafat",
# 	"pay:Consumer" => @consumer,
# 	"pay:Status" => "1",
# 	"pay:LastUpdatedDate" => "2016-02-26T14:04:08.016+08:00",
# 	"pay:PayeeMobileNumber" => "987654321",
# 	"pay:PayeeEmailId" => "a@b.c",
# 	"pay:BillerDetails" => @billerDetails
# }
# end