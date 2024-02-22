## Table of Contents

- [file_service.proto](#file_service-proto)
    - [FileService](#proto-FileService)
  



<a name="file_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## file_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-FileService"></a>

### FileService
Transactions and queries for the file service.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createFile | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Creates a file |
| updateFile | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Updates a file |
| deleteFile | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a file |
| appendContent | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Appends to a file |
| getFileContent | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the file contents |
| getFileInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the file information |
| systemDelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a file if the submitting account has network admin privileges |
| systemUndelete | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Undeletes a file if the submitting account has network admin privileges |

 <!-- end services -->


