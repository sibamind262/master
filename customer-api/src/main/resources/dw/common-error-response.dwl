%dw 2.0
output application/json skipNullOn="everywhere"
---
error: {
    errorCode: if(vars.errorCode != null) vars.errorCode else error.errorType.identifier,
    errorDateTime: now() as String { format: "yyyy-MM-dd'T'HH:mm:ss" },
    errorMessage: if(vars.errorMessage != null) vars.errorMessage else if (error.errorMessage.payload.error.errorMessage !=null) (error.errorMessage.payload.error.errorMessage) else (error.description default "")
}
