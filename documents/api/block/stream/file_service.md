## Table of Contents

- [stream/file_service.proto](#stream_file_service-proto)
    - [CreateFileOutput](#proto-CreateFileOutput)
  



<a name="stream_file_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/file_service.proto
# File Service
Block stream messages that report the results of transactions handled by the `File` service.

A `file` in Hedera is an arbitrary sequence of bytes and may be up to `1048576` total bytes.
Files are used anywhere a transaction requires a large amount of data (anything that would not
fit within the transaction size limit).

Examples
 - smart contract bytecode
 - network configuration updates
 - network fee schedules
 - image files for NFTs
 - property title documents
There are many other uses; these examples are illustrative.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-CreateFileOutput"></a>

### CreateFileOutput
Block Stream data for a `fileCreate` transaction.

This message SHALL NOT duplicate information already contained in the original transaction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| file_id | [FileID](#proto-FileID) |  | A file identifier.<br/> This field SHALL report the identifier for the newly created file. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



