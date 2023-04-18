import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {
    resource function post updateUserInfo(http:Caller caller, http:Request request) returns error? {
        // Extract the JSON payload from the request.
        json payload = check request.getJsonPayload();
        log:printInfo("Payload: " + payload.toJsonString());
        // Send a response back to the caller.
        check caller->respond("Hello, payload Received");
    }

}
