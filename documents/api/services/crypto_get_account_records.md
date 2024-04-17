## Table of Contents

- [crypto_get_account_records.proto](#crypto_get_account_records-proto)
    - [CryptoGetAccountRecordsQuery](#proto-CryptoGetAccountRecordsQuery)
    - [CryptoGetAccountRecordsResponse](#proto-CryptoGetAccountRecordsResponse)
  



<a name="crypto_get_account_records-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_get_account_records.proto
# Crypto Get Account Records
Messages for a query to retrieve recent transaction records involving a
specified account as effective `payer`.<br/>
A "recent" transaction is typically one that reached consensus within
the previous three(`3`) minutes of _consensus_ time. Additionally, the
network only stores records in state when
`ledger.keepRecordsInState=true` was true during transaction handling.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoGetAccountRecordsQuery"></a>

### CryptoGetAccountRecordsQuery
Request records of all "recent" transactions for which the specified
account is the effective payer.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [QueryHeader](#proto-QueryHeader) |  | Standard information sent with every query operation.<br/> This includes the signed payment and what kind of response is requested (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | An account identifier.<br/> This identifies the account to use when filtering the transaction record lists. <p> This field is REQUIRED. |






<a name="proto-CryptoGetAccountRecordsResponse"></a>

### CryptoGetAccountRecordsResponse
Return records of all "recent" transactions for which the specified
account is the effective payer.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| header | [ResponseHeader](#proto-ResponseHeader) |  | The standard response information for queries.<br/> This includes the values requested in the `QueryHeader` (cost, state proof, both, or neither). |
| accountID | [AccountID](#proto-AccountID) |  | An account identifier.<br/> This identifies the account used when filtering the transaction record lists. <p> This field SHALL match the requested account identifier. |
| records | [TransactionRecord](#proto-TransactionRecord) | repeated | A list of records. <p> This list SHALL contain all available and "recent" records in which the account identified in the `accountID` field acted as effective payer. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


