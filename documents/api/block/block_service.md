## Table of Contents

- [block_service.proto](#block_service-proto)
    - [ReadBlockRequest](#com-hedera-hapi-block-ReadBlockRequest)
    - [ReadBlockResponse](#com-hedera-hapi-block-ReadBlockResponse)
    - [ReadStreamRequest](#com-hedera-hapi-block-ReadStreamRequest)
    - [ReadStreamResponse](#com-hedera-hapi-block-ReadStreamResponse)
    - [ServerStatusRequest](#com-hedera-hapi-block-ServerStatusRequest)
    - [ServerStatusResponse](#com-hedera-hapi-block-ServerStatusResponse)
    - [ServerStatusResponse.PriceList](#com-hedera-hapi-block-ServerStatusResponse-PriceList)
    - [StateSnapshotRequest](#com-hedera-hapi-block-StateSnapshotRequest)
    - [StateSnapshotResponse](#com-hedera-hapi-block-StateSnapshotResponse)
    - [WriteStreamRequest](#com-hedera-hapi-block-WriteStreamRequest)
    - [WriteStreamResponse](#com-hedera-hapi-block-WriteStreamResponse)
    - [WriteStreamResponse.Acknowledgement](#com-hedera-hapi-block-WriteStreamResponse-Acknowledgement)
    - [WriteStreamResponse.BlockAcknowledgement](#com-hedera-hapi-block-WriteStreamResponse-BlockAcknowledgement)
    - [WriteStreamResponse.EndOfStream](#com-hedera-hapi-block-WriteStreamResponse-EndOfStream)
    - [WriteStreamResponse.ItemAcknowledgement](#com-hedera-hapi-block-WriteStreamResponse-ItemAcknowledgement)
  
    - [ReadBlockResponse.ResponseCode](#com-hedera-hapi-block-ReadBlockResponse-ResponseCode)
    - [ReadStreamResponse.ResponseCode](#com-hedera-hapi-block-ReadStreamResponse-ResponseCode)
    - [StateSnapshotResponse.ResponseCode](#com-hedera-hapi-block-StateSnapshotResponse-ResponseCode)
    - [WriteStreamResponse.ResponseCode](#com-hedera-hapi-block-WriteStreamResponse-ResponseCode)
  
    - [BlockStreamService](#com-hedera-hapi-block-BlockStreamService)
  



<a name="block_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## block_service.proto
# Block Service
The Service API exposed by the Block Nodes.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="com-hedera-hapi-block-ReadBlockRequest"></a>

### ReadBlockRequest
A request to read a single block.

A client system SHALL send this message to request a single block, including the
block state proof.

> REVIEW NOTE
>> We _could_ make `block_number` optional and remove `retrieve_latest`. An **unset**
>> `block_number` would then result in returning the latest block.<br/>
>> It is not entirely clear which option would be easier for developers to use, but
>> initial intuition is that a boolean is easier to understand and use.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  | The block number of a block to retrieve.<br/> The requested block MUST exist on the block node.<br/> This value MUST NOT be set if `retrieve_latest` is set `true`.<br/> This value MUST be set to a valid block number if `retrieve_latest` is unset or is set `false`. |
| retrieve_latest | [bool](#bool) |  | A boolean to request the latest available block.<br/> This value MAY be set `true` to request the last block available.<br/> If this value is set to `true` then `block_number` MUST NOT be set and SHALL be ignored. |






<a name="com-hedera-hapi-block-ReadBlockResponse"></a>

### ReadBlockResponse
A response to a `readBlock` request.

This message SHALL be sent in response to a request, and SHALL contain at least a
valid `status`.<br/>
If `status` is `READ_BLOCK_SUCCESS`, the response SHALL contain the requested
block in the `block` field.

> Note
>> A block can become quite large. A client MUST be prepared to receive the
>> full content of the block, perhaps many megabytes of data.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [ReadBlockResponse.ResponseCode](#com-hedera-hapi-block-ReadBlockResponse-ResponseCode) |  | A response status.<br/> The reported status SHALL reflect the success of the request, or a detailed reason the request failed. |
| block | [stream.Block](#com-hedera-hapi-block-stream-Block) |  | The requested block.<br/> This container object SHALL hold the entire sequence of block items for the requested block.<br/> The block items in this message SHALL be in the same order as received.<br/> The items in this message SHALL begin with a `BlockHeader` and end with a `BlockStateProof` applicable to this block. |






<a name="com-hedera-hapi-block-ReadStreamRequest"></a>

### ReadStreamRequest
A request to stream block items from block node to a client.

The block node SHALL respond to this request with a stream of
`ReadStreamResponse` messages.<br/>
The block node SHALL stream the full contents of the blocks requested.<br/>
The block items SHALL be streamed in order originally produced within a block.<br/>
The blocks SHALL be streamed in ascending order by `block_number`.<br/>
The block node SHALL end the stream when the last requested block has been sent.<br/>
The block node SHALL end the stream with a response code status of SUCCESS when
the stream is complete.<br/>
The client SHOULD call the `serverStatus` rpc prior to constructing this request
to determine the available start and end blocks.

> REVIEW NOTE
>> This lacks application-level error detection. If the client receives a bad
>> message (e.g. due to networking errors) it must await the full stream, then
>> determine which item failed, then request at least one, and possibly many,
>> blocks again.<p/>
>> Should we offer a more callback-style interface where the client offers a
>> gRPC endpoint that implements `writeBlockStream`, as specified below?
>> That would allow the client to perform ack/nack on a per-item basis and
>> we could immediately retransmit only failed items (reducing waste).
>> This would not work with current "pay to send" design there, but there are
>> many concerns with the "payment is auth" design; which likely necessitates
>> changes that should resolve this sub-issue.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start_block_number | [uint64](#uint64) |  | A block number<br/> This SHALL be the block number of the first block returned.<br/> This field MUST be less than or equal to the latest available block number. |
| end_block_number | [uint64](#uint64) |  | A block number<br/> This value SHALL be the block number of the last block returned.<br/> This field MUST NOT be less than `start_block_number`.<br/> This SHOULD be a block number that is immediately available from the block node.<br/> A block node SHALL continue to stream blocks until the last requested block is transmitted.<br/> A block node implementation MAY reject a request for a block that is not yet available.<br/> A block node implementation MAY accept future block numbers. Block node implementations SHOULD charge increased fees for such "future" streams. |






<a name="com-hedera-hapi-block-ReadStreamResponse"></a>

### ReadStreamResponse
One item in a stream of `readBlockStream` responses.

The block node SHALL respond to a `readBlockStream` request with a stream of
`ReadStreamResponse` messages.<br/>
The block node SHALL stream the full contents of the blocks requested.<br/>
The block items SHALL be streamed in order originally produced within a block.<br/>
The blocks SHALL be streamed in ascending order by `block_number`.<br/>
The block node SHALL end the stream when the last requested block has been sent.<br/>
The block node SHALL end the stream with a response code status of SUCCESS when
the stream is complete.<br/>
The block node SHALL end the stream with a response code status of
`READ_STREAM_INVALID_START_BLOCK_NUMBER` if the start block number is greater
than the end block number.<br/>
The block node SHALL end the stream with a response code status of
`READ_STREAM_INSUFFICIENT_BALANCE` if insufficient balance remains to complete
the requested stream.
The block node SHALL make every reasonable effort to fulfill as much of the
request as available balance supports, in the event balance is not sufficient
to complete the request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [ReadStreamResponse.ResponseCode](#com-hedera-hapi-block-ReadStreamResponse-ResponseCode) |  | A final response item describing the terminal status of this stream.<br/> The block node server SHALL end the stream following this message. |
| block_item | [stream.BlockItem](#com-hedera-hapi-block-stream-BlockItem) |  | A stream response item containing a single `BlockItem`.<br/> The full response SHALL consist of many `block_item` messages followed by a single `status` message. |






<a name="com-hedera-hapi-block-ServerStatusRequest"></a>

### ServerStatusRequest
A request for the status of a block node server.






<a name="com-hedera-hapi-block-ServerStatusResponse"></a>

### ServerStatusResponse
A response to a server status request.

This message SHALL provide a client with information needed to successfully
query this block node server for a block, stream of blocks, or state snapshot.<br/>
A request for blocks between `first_available_block` and `last_available_block`,
inclusive, SHOULD succeed. Any request for blocks outside that range SHOULD fail.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| first_available_block | [uint64](#uint64) |  | The lowest numbered block available on this block node server.<br/> Any request for a block with lower number than this value SHALL fail with a status value indicating and invalid start block number. |
| last_available_block | [uint64](#uint64) |  | The greatest block number available from this block node server.<br/> Any request for a block with a block number higher than this value MAY fail. |
| only_latest_state | [bool](#bool) |  | A flag indicating this block node only offers the latest state snapshot.<br/> If this value is `true` the client MUST set `retrieve_latest` `true` in any `StateSnapshotRequest` sent to this block node. |
| server_price_list | [ServerStatusResponse.PriceList](#com-hedera-hapi-block-ServerStatusResponse-PriceList) |  | The current price list for this block node.<br/> This price list SHALL be valid until the expiration instant given and SHALL reflect the actual cost for each request to this block node during that time. An honest block node server SHALL NOT charge fees different from this price list for a request made while it is valid. |






<a name="com-hedera-hapi-block-ServerStatusResponse-PriceList"></a>

### ServerStatusResponse.PriceList
A Block Node Server price list.

Each block node server SHOULD independently set the price for each request type
and item requested.<br/>
A block node server MAY adjust pricing dynamically based on load, demand, or other
factors, but MUST provide an accurate price list when requested.<br/>
A block node server is RECOMMENDED to provide a minimum expiration time for a price
list of 300 seconds or greater.






<a name="com-hedera-hapi-block-StateSnapshotRequest"></a>

### StateSnapshotRequest
A request to read a state snapshot.

A state snapshot is a full copy of the network state at the completion of a particular
block.

This request MUST contain a block number that has already reached this block node
and completed verification, or request the "latest" snapshot.<br/>
This request MAY request the "latest" snapshot, and the block node SHALL respond
with a reference to a snapshot containing the most recent contents of the network
state known to that block node.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| last_block_number | [uint64](#uint64) |  | A block number.<br/> This SHALL be the last block number present in the snapshot returned.<br/> If `retrieve_latest` is set `true` this field SHOULD NOT be set and SHALL be ignored. A block node implementation MAY reject any request with a non-default value for this field, but MUST clearly document that behavior. |
| retrieve_latest | [bool](#bool) |  | A boolean to request the latest available snapshot.<br/> This value MAY be set `true` to request the most recent state snapshot available.<br/> If this value is set to `true` then `last_block_number` SHOULD NOT be set and SHALL be ignored. A block node implementation MAY reject any request with that does _not_ set this field `true`, but MUST clearly document that behavior. |






<a name="com-hedera-hapi-block-StateSnapshotResponse"></a>

### StateSnapshotResponse
A response to a request for a state snapshot.

This message SHALL deliver a _reference_ to the requested snapshot data if successful.<br/>
This message SHALL deliver a code indicating the reason for failure if unsuccessful.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [StateSnapshotResponse.ResponseCode](#com-hedera-hapi-block-StateSnapshotResponse-ResponseCode) |  | A status response.<br/> This code SHALL indicate a successful call, or the detailed reason for failure. |
| last_block_number | [uint64](#uint64) |  | A block number.<br/> This SHALL be the number of the last block included in this state snapshot. |
| snapshot_reference | [string](#string) |  | A reference to where the requested state snapshot may be obtained.<br/> <blockquote>REVIEW NOTE<blockquote> This is TEMPORARY. We have not yet designed how state snapshots may be sent. One idea is to use `Any` and let implementations decide; another is to use a time limited URL (with the same login as the block node server); another is to use a customer-pays cloud storage bucket. </blockquote></blockquote> |






<a name="com-hedera-hapi-block-WriteStreamRequest"></a>

### WriteStreamRequest
Write a stream of blocks.

Each item in the stream MUST contain one `BlockItem`.<br/>
Each Block MUST begin with a single `BlockHeader` block item.<br/>
The block node SHALL append each `BlockItem` to an internal structure
to construct full blocks.<br/>
The block node MUST verify the running hash for each item before sending a
response message acknowledging that item.
Each Block MUST end with a single `BlockStateProof` block item.<br/>
The block node MUST verify the Block using the `BlockStateProof` to
ensure all data was received correctly.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_item | [stream.BlockItem](#com-hedera-hapi-block-stream-BlockItem) |  | A single item written to the block stream. |






<a name="com-hedera-hapi-block-WriteStreamResponse"></a>

### WriteStreamResponse
A partial response to writing a block stream.

This message is sent in response to each BlockItem in a block stream sent to
a block node. The block stream is sent as a stream of messages, and each message
MUST be acknowledged with a message of this type.<br/>
Each `BlockItem` SHALL be acknowledged with an `Acknowledgement` response.<br/>
Each completed block SHALL be acknowledged with an `Acknowledgement` response.<br/>
A final response SHALL be sent with an `EndOfStream` status result after the last
block stream item is received.<br/>
If a failure is detected (which may include a block or block item that fails validation)
an `EndOfStream` response SHALL be sent with a relevant error status.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| acknowledgement | [WriteStreamResponse.Acknowledgement](#com-hedera-hapi-block-WriteStreamResponse-Acknowledgement) |  | A response sent for each item and for each block. |
| status | [WriteStreamResponse.EndOfStream](#com-hedera-hapi-block-WriteStreamResponse-EndOfStream) |  | A response sent when a stream ends. |






<a name="com-hedera-hapi-block-WriteStreamResponse-Acknowledgement"></a>

### WriteStreamResponse.Acknowledgement
A response to acknowledge receipt and verification of a single item or full block.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_ack | [WriteStreamResponse.BlockAcknowledgement](#com-hedera-hapi-block-WriteStreamResponse-BlockAcknowledgement) |  | A response type to acknowledge a full and complete block. |
| item_ack | [WriteStreamResponse.ItemAcknowledgement](#com-hedera-hapi-block-WriteStreamResponse-ItemAcknowledgement) |  | A response type to acknowledge a single `BlockItem`. |






<a name="com-hedera-hapi-block-WriteStreamResponse-BlockAcknowledgement"></a>

### WriteStreamResponse.BlockAcknowledgement
Acknowledgement of a full block.

This response SHALL be sent after a block state proof item is received and
verified.<br/>
The block node SHALL send exactly one `BlockAcknowledgement` for each successful
block.<br/>
The `BlockAcknowledgement` response SHALL be sent after sending an
`ItemAcknowledgement` response for the `BlockStateProof` item at the end of the
block.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| block_number | [uint64](#uint64) |  | The number of the acknowledged block.<br/> A source system SHOULD verify that this value matches the block sent. |
| block_already_exists | [bool](#bool) |  | A flag indicating that the received block duplicates an existing block.<br/> If a source system receives acknowledgement with this flag set true the source system SHOULD end the stream and query the block node for the highest known block before continuing. |






<a name="com-hedera-hapi-block-WriteStreamResponse-EndOfStream"></a>

### WriteStreamResponse.EndOfStream
A message sent to end a stream.

This response message SHALL be sent from a block node to a block stream source
system when a `writeBlockStream` stream ends.<br/>
This message SHALL be sent exactly once for each `writeBlockStream` call. The
source system SHALL cease sending block items upon receiving this response, and
MAY determine the ending state of the stream from the `status` enumeration and
the `block_number` returned.<br/>
A source system SHOULD verify that the `block_number` value matches the last block
sent, and SHOULD resend one or more blocks if the value here does not match the
expected value.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| status | [WriteStreamResponse.ResponseCode](#com-hedera-hapi-block-WriteStreamResponse-ResponseCode) |  | A response code.<br/> This code indicates the reason the stream ended.<br/> This value MUST be set to a non-default value. |
| block_number | [uint64](#uint64) |  | The number of the last completed and _verified_ block.<br/> Nodes SHOULD only end a stream after a block state proof to avoid the need to resend items.<br/> If status is a failure code, the source node MUST start a new stream at the beginning of the first block _following_ this number (e.g. if this is 91827362983, then the new stream must start with the _header_ for block 91827362984). |






<a name="com-hedera-hapi-block-WriteStreamResponse-ItemAcknowledgement"></a>

### WriteStreamResponse.ItemAcknowledgement
Acknowledgement for a single `BlockItem`.

The block node SHALL send one `ItemAcknowledgement` for each `BlockItem`
received and verified.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| item_hash | [bytes](#bytes) |  | A SHA2-384 hash of the `BlockItem` received.<br/> This field is REQUIRED.<br/> A source system MUST verify that this value matches its own internal calculated hash value, and MUST end the stream if the values do not match. |





 <!-- end messages -->


<a name="com-hedera-hapi-block-ReadBlockResponse-ResponseCode"></a>

### ReadBlockResponse.ResponseCode
An enumeration indicating the status of this request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| READ_BLOCK_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| READ_BLOCK_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| READ_BLOCK_SUCCESS | 2 | The request succeeded.<br/> The requested block SHALL be returned in the `block` field. |
| READ_BLOCK_NOT_FOUND | 3 | The requested block was not found.<br/> Something failed and a block that SHOULD be available was not found.<br/> The client MAY retry the request; if this result is repeated the request SHOULD be directed to a different block node server. |
| READ_BLOCK_NOT_AVAILABLE | 4 | The requested block is not available on this block node server.<br/> The client SHOULD send a `serverStatus` request to determine the lowest and highest block numbers available at this block node server. |



<a name="com-hedera-hapi-block-ReadStreamResponse-ResponseCode"></a>

### ReadStreamResponse.ResponseCode
An enumeration indicating the status of this request.

This response code SHALL be the last message in the stream of responses.
This code SHALL represent the final status of the full request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| READ_STREAM_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| READ_STREAM_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| READ_STREAM_SUCCESS | 2 | The request succeeded.<br/> The requested block(s) SHALL precede the status response with this value. |
| READ_STREAM_INVALID_START_BLOCK_NUMBER | 3 | The requested start block number is not valid.<br/> The start block number is after the end block number, less than `0`, or otherwise invalid.<br/> The client MAY retry this request, but MUST change the `start_block_number` field to a valid start block. |
| READ_STREAM_INVALID_END_BLOCK_NUMBER | 4 | The requested end block number is not valid.<br/> The end block number is greater than the highest current block number, less than `0`, or otherwise invalid.<br/> The client MAY retry this request, but MUST change the `end_block_number` field to a valid end block. |



<a name="com-hedera-hapi-block-StateSnapshotResponse-ResponseCode"></a>

### StateSnapshotResponse.ResponseCode
An enumeration indicating the status of this request.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STATE_SNAPSHOT_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| STATE_SNAPSHOT_INSUFFICIENT_BALANCE | 1 | The requesting client account lacks sufficient HBAR to pay the service fee for this request.<br/> The client MAY retry the request, but MUST increase the client account balance with this block node server before doing so. |
| STATE_SNAPSHOT_SUCCESS | 2 | The request succeeded.<br/> The full snapshot data MAY be read via the endpoint provided in the `snapshot_reference` field for the duration specified. |



<a name="com-hedera-hapi-block-WriteStreamResponse-ResponseCode"></a>

### WriteStreamResponse.ResponseCode
An enumeration indicating the status of this request.

This enumeration describes the reason a block stream (sent via
`writeBlockStream`) ended.

| Name | Number | Description |
| ---- | ------ | ----------- |
| STREAM_ITEMS_UNKNOWN | 0 | An "unset value" flag, this value SHALL NOT be used.<br/> This status indicates the server software failed to set a status, and SHALL be considered a software defect. |
| STREAM_ITEMS_SUCCESS | 1 | The request succeeded.<br/> No errors occurred and the source node orderly ended the stream. |
| STREAM_ITEMS_TIMEOUT | 2 | The delay between items was too long.<br/> The source MUST start a new stream before the failed block. |
| STREAM_ITEMS_OUT_OF_ORDER | 3 | An item was received out-of-order. The source MUST start a new stream before the failed block. |
| STREAM_ITEMS_BAD_STATE_PROOF | 4 | A block state proof item could not be validated. The source MUST start a new stream before the failed block. |


 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="com-hedera-hapi-block-BlockStreamService"></a>

### BlockStreamService
Remote procedure calls (RPCs) for the Block Node.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| serverStatus | [ServerStatusRequest](#com-hedera-hapi-block-ServerStatusRequest) | [ServerStatusResponse](#com-hedera-hapi-block-ServerStatusResponse) | Read the status of this block node server.<br/> A client SHOULD request server status prior to requesting block stream data or a state snapshot. |
| readBlock | [ReadBlockRequest](#com-hedera-hapi-block-ReadBlockRequest) | [ReadBlockResponse](#com-hedera-hapi-block-ReadBlockResponse) | Read a block from the block node.<br/> The request SHALL describe the block number of the block to retrieve. |
| stateSnapshot | [StateSnapshotRequest](#com-hedera-hapi-block-StateSnapshotRequest) | [StateSnapshotResponse](#com-hedera-hapi-block-StateSnapshotResponse) | Read a state snapshot from the block node.<br/> The request SHALL describe the last block number present in the snapshot.<br/> Block node implementations MAY decline a request for a snapshot older than the latest available, but MUST clearly document this behavior. |
| writeBlockStream | [WriteStreamRequest](#com-hedera-hapi-block-WriteStreamRequest) stream | [WriteStreamResponse](#com-hedera-hapi-block-WriteStreamResponse) stream | Write a stream of blocks.<br/> Each item in the stream MUST contain one `BlockItem`.<br/> Each Block MUST begin with a single `BlockHeader` block item.<br/> The block node SHALL append each `BlockItem` to an internal structure to construct full blocks.<br/> Each Block MUST end with a single `BlockStateProof` block item.<br/> It is RECOMMENDED that the implementations verify the Block using the `BlockStateProof` to validate all data was received correctly.<br/> This API SHOULD, generally, be restricted based on mTLS authentication to a limited set of source (i.e. consensus node) systems. |
| readBlockStream | [ReadStreamRequest](#com-hedera-hapi-block-ReadStreamRequest) stream | [ReadStreamResponse](#com-hedera-hapi-block-ReadStreamResponse) stream | Read a stream of blocks.<br/> Each item in the stream SHALL contain one `BlockItem` or a response code.<br/> The request message MUST specify start and end block numbers to return/<br/> The block node SHALL stream the full contents of the blocks requested.<br/> The block items SHALL be streamed in order originally produced within a block.<br/> The blocks shall be streamed in ascending order by `block_number`.<br/> The block node SHALL end the stream when the last requested block has been sent.<br/> The block node SHALL end the stream with response code containing a status of SUCCESS when the stream is complete.<br/> The block node SHALL end the stream with a response code containing a status of `READ_STREAM_INVALID_START_BLOCK_NUMBER` if the start block number is greater than the end block number.<br/> The block node SHALL end the stream with a response code containing a status of `READ_STREAM_PAYMENT_INSUFFICIENT` if insufficient payment remains to complete the requested stream. The block node SHALL make every reasonable effort to fulfill as much of the request as possible in the event payment is not sufficient to complete the request. |

 <!-- end services -->



