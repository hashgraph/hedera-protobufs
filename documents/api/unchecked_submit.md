## Table of Contents

- [unchecked_submit.proto](#unchecked_submit-proto)
    - [UncheckedSubmitBody](#proto-UncheckedSubmitBody)
  



<a name="unchecked_submit-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## unchecked_submit.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-UncheckedSubmitBody"></a>

### UncheckedSubmitBody
Submit an arbitrary (serialized) Transaction to the network without prechecks. Requires superuser
privileges.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transactionBytes | [bytes](#bytes) |  | The serialized bytes of the Transaction to be submitted without prechecks |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


