## Table of Contents

- [network_service.proto](#network_service-proto)
    - [NetworkService](#proto-NetworkService)
  



<a name="network_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## network_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-NetworkService"></a>

### NetworkService
The requests and responses for different network services.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| getVersionInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the active versions of Hedera Services and HAPI proto |
| getExecutionTime | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the time in nanoseconds spent in <tt>handleTransaction</tt> for one or more TransactionIDs (assuming they have reached consensus "recently", since only a limited number of execution times are kept in-memory, depending on the value of the node-local property <tt>stats.executionTimesToTrack</tt>). |
| uncheckedSubmit | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Submits a "wrapped" transaction to the network, skipping its standard prechecks. (Note that the "wrapper" <tt>UncheckedSubmit</tt> transaction is still subject to normal prechecks, including an authorization requirement that its payer be either the treasury or system admin account.) |
| getAccountDetails | [Query](#proto-Query) | [Response](#proto-Response) | Get all the information about an account, including balance and allowances. This does not get the list of account records. |

 <!-- end services -->


