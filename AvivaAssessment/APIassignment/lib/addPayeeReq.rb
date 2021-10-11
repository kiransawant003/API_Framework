class AddPayeeReq< HeaderService
	

def payLimits(txntypecd,bMinamt,bMaxamt) 

@payLimit = {
	"com:TxnTypeCd" => txntypecd,
	"com:BillerMinPmt" => bMinamt,
	"com:BillerMaxPmt" => bMaxamt,

	# "com:TxnTypeCd" => "1",
	# "com:BillerMinPmt" => "10",
	# "com:BillerMaxPmt" => "10000",

}
end

def billerdetails(bCatId,bCatName,bId,bName,prType,deAmt,pLimit)

@billerDetails = {
	"com:BillerCategoryId" => bCatId,
	"com:BillerCategoryName" => bCatName,
	"com:BillerId" => bId,
	"com:BillerName" => bName,
	"com:presentmentType" => prType,
	"com:defaultAmount" => deAmt,
	"com:PayLimit" => pLimit


	# "com:BillerCategoryId" => "152",
	# "com:BillerCategoryName" => "AIRTIME",
	# "com:BillerId" => "KECSCSSAFCOMKE",
	# "com:BillerName" => "SAFARICOM",
	# "com:presentmentType" => "1",
	# "com:defaultAmount" => "1",
	# "com:PayLimit" => payLimits
}
end
def consumer(consNo)
@consumer = {
	"com:ConsumerNo" => consNo

	# "com:ConsumerNo" => "1526009"
}

end

def payeedetails(payid,payNick,cons,status,lupdateDate,pMblNum,pEmail,bdets)
@payeeDetails = {
	"pay:PayeeId" =>payid,
	"pay:PayeeNickname" => payNick,
	"pay:Consumer" => cons,
	"pay:Status" => status,
	"pay:LastUpdatedDate" => lupdateDate,
	"pay:PayeeMobileNumber" => pMblNum,
	"pay:PayeeEmailId" => pEmail,
	"pay:BillerDetails" => bdets
}
return @payeeDetails
end
end


