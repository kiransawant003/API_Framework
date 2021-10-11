class ValidatePayeeReq < HeaderService

	def payeeDetails(payeeId, payeeNickname, payeeName, consNo, billerID, payAmt, payCur, sofund)

		@payeeDet={
			"pay:PayeeId" => payeeId,
			"pay:PayeeNickname" => payeeNickname,
			"pay:payeeName" => payeeName,
			"pay:ConsumerNo" => consNo,
			"pay:BillerId" => billerID,
			"pay:paymentAmount" => payAmt,
			"pay:paymentCurrency" => payCur,
			"pay:sourceOfFund" => sofund
		}
		return @payeeDet
	end

	def validatePayeeattr(customerID, custName, segCode, custType, isStaff, phone, eMail, date,channel, cntry, lang, sessID, org, version, partName, partType, serName, serTxnType, hostEnv, reqID)
		@customerid = customerID
		@customername = custName
		@segcode = segCode
		@custtype = custType
		@isstaff = isStaff
		@phone = phone
		@email = eMail
		@date = date
		@channel = channel
		@cntry = cntry
		@lang = lang
		@sessionid = sessID
		@org = org
		@version = version
		@partname = partName
		@parttype = partType
		@sername = serName
		@sertxntype = serTxnType
		@hostenv = hostEnv
		@reqid = reqID
	

	end
		
end
