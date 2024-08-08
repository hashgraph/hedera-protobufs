## Table of Contents

- [stream/input/event_metadata.proto](#stream_input_event_metadata-proto)
    - [EventHeader](#com-hedera-hapi-block-stream-input-EventHeader)
  



<a name="stream_input_event_metadata-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## stream/input/event_metadata.proto
# Event Header
This header precedes the event messages that contain transactions.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="com-hedera-hapi-block-stream-input-EventHeader"></a>

### EventHeader
A header for a single event.<br/>
This message delivers information about an event and its parents.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| event_core | [com.hedera.hapi.platform.event.EventCore](#com-hedera-hapi-platform-event-EventCore) |  | An event core value.<br/> This provides information about the event creator and the event "parents". Event "parents" includes the "self parent" if any. |
| signature | [bytes](#bytes) |  | A single node event signature.<br/> This is the event creator's signature for this event. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



