## Table of Contents

- [unchecked_submit.proto](#unchecked_submit-proto)
    - [UncheckedSubmitBody](#proto-UncheckedSubmitBody)
  



<a name="unchecked_submit-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## unchecked_submit.proto
# Unchecked Submit
Submit a transaction to the network, bypassing all but the most minimal
validation.

> Important
>> This transaction is obsolete and not supported.<br/>
>> Any transaction of this type that is submitted SHALL fail with a
>> `PRE_CHECK` result of `NOT_SUPPORTED`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-UncheckedSubmitBody"></a>

### UncheckedSubmitBody
Submit an arbitrary (serialized) Transaction to the network
without pre-check.

This transaction SHALL require `superuser` privileges
(e.g. the `treasury` or `systemAdmin` accounts).


| Field | Type | Description |
| ----- | ---- | ----------- |
| transactionBytes | [bytes](#bytes) | The serialized bytes of a `Transaction`. <p> This transaction SHALL be deserialized and submitted for consensus with no further validation.<br/> Specifically, the transaction may violate basic limits and constraints such as size limits, minimum or maximum values, valid start time, fee calculations, etc... |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



