## Table of Contents

- [crypto_get_account_records.proto](#crypto_get_account_records-proto)
    - [CryptoGetAccountRecordsQuery](#proto-CryptoGetAccountRecordsQuery)
    - [CryptoGetAccountRecordsResponse](#proto-CryptoGetAccountRecordsResponse)
  



<a name="crypto_get_account_records-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_account_records.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CryptoGetAccountRecordsQuery"></a>

### CryptoGetAccountRecordsQuery
Requests records of all transactions for which the given account was the effective payer in the last 3 minutes of consensus time and <tt>ledger.keepRecordsInState=true</tt> was true during <tt>handleTransaction</tt>.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | The account ID for which the records should be retrieved |






<a name="proto-CryptoGetAccountRecordsResponse"></a>

### CryptoGetAccountRecordsResponse
Returns records of all transactions for which the given account was the effective payer in the last 3 minutes of consensus time and <tt>ledger.keepRecordsInState=true</tt> was true during <tt>handleTransaction</tt>.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader`; cost, state proof, both, or neither. |
| accountID | [AccountID](#proto-AccountID) |  | The account that this record is for |
| records | [TransactionRecord](#proto-TransactionRecord) | repeated | List of records |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


