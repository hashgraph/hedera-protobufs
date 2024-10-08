## Table of Contents

- [stream/output/file_service.proto](#stream_output_file_service-proto)
    - [AppendFileOutput](#com-hedera-hapi-block-stream-output-AppendFileOutput)
    - [CreateFileOutput](#com-hedera-hapi-block-stream-output-CreateFileOutput)
    - [DeleteFileOutput](#com-hedera-hapi-block-stream-output-DeleteFileOutput)
    - [SystemDeleteOutput](#com-hedera-hapi-block-stream-output-SystemDeleteOutput)
    - [SystemUndeleteOutput](#com-hedera-hapi-block-stream-output-SystemUndeleteOutput)
    - [UpdateFileOutput](#com-hedera-hapi-block-stream-output-UpdateFileOutput)
  



<a name="stream_output_file_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/output/file_service.proto
# File Service
Block stream messages that report the results of transactions handled
by the `File` service.

A `file` in Hedera is an arbitrary sequence of bytes and may be up to
`1048576` total bytes. Files are used anywhere a transaction requires a
large amount of data (anything that would not fit within the
transaction size limit).

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
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-output-AppendFileOutput"></a>

### AppendFileOutput
Block Stream data for a `fileAppend` transaction.

This message SHALL NOT duplicate information already contained
in the original transaction.






<a name="com-hedera-hapi-block-stream-output-CreateFileOutput"></a>

### CreateFileOutput
Block Stream data for a `fileCreate` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-DeleteFileOutput"></a>

### DeleteFileOutput
Block Stream data for a `fileDelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-SystemDeleteOutput"></a>

### SystemDeleteOutput
Block Stream data for a `systemDelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-SystemUndeleteOutput"></a>

### SystemUndeleteOutput
Block Stream data for a `systemUndelete` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.






<a name="com-hedera-hapi-block-stream-output-UpdateFileOutput"></a>

### UpdateFileOutput
Block Stream data for a `fileUpdate` transaction.

This message SHALL NOT duplicate information already contained in
the original transaction.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



