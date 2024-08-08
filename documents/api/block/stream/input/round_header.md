## Table of Contents

- [stream/input/round_header.proto](#stream_input_round_header-proto)
    - [RoundHeader](#com-hedera-hapi-block-stream-input-RoundHeader)
  



<a name="stream_input_round_header-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/input/round_header.proto
# Round Header
This header delineates the start of a single consensus round.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-input-RoundHeader"></a>

### RoundHeader
A header for a single round.<br/>
This message delivers information about a consensus round.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| round_number | [uint64](#uint64) |  | A round number.<br/> This is the number assigned to the round for consensus. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



