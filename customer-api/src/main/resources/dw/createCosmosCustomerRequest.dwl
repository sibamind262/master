%dw 2.0
output application/json
---
 {"customerId":vars.customerId} ++ vars.inputPayload 