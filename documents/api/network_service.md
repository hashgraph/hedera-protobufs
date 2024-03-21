## Table of Contents

- [network_service.proto](#network_service-proto)
    - [NetworkService](#proto-NetworkService)
  



<a name="network_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_service.proto
# Network Service
This service offers some basic "network information" queries.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-NetworkService"></a>

### NetworkService
Basic "network information" queries.

This service supports queries for the active services and API versions, and account details.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| getVersionInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the active versions of Hedera Services and API messages. |
| getAccountDetails | [Query](#proto-Query) | [Response](#proto-Response) | Request detail information about an account.<br/> The returned information SHALL include balance and allowances.<br/> The returned information SHALL NOT include a list of account records. |
| getExecutionTime | [Query](#proto-Query) | [Response](#proto-Response) | Retrieve the time, in nanoseconds, spent in direct processing for one or more recent transactions.<br/> For each transaction identifier provided, if that transaction is sufficiently recent (that is, it is within the range of the configuration value `stats.executionTimesToTrack`), the node SHALL return the time, in nanoseconds, spent to directly process that transaction (that is, excluding time to reach consensus).<br/> Note that because each node processes every transaction for the Hedera network, this query MAY be sent to any node. &nbsp; <blockquote>Important<blockquote> This query is obsolete, not supported, and SHALL fail with a pre-check result of `NOT_SUPPORTED`.</blockquote></blockquote> |
| uncheckedSubmit | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Submit a transaction that wraps another transaction which will skip most validation.<br/> <blockquote>Important<blockquote> This transaction SHALL NOT, under any circumstances, be enabled in mainnet.<br/> The `uncheckedSubmit` transaction SHALL NOT be accepted unless signed by the `treasury` account or the `systemAdmin` account.</blockquote></blockquote> |

 <!-- end services -->


