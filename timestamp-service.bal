import ballerina/http;
import ballerina/log;
import ballerina/time;
// import ballerina/io;
service hello on new http:Listener(9090) {
  resource function sayHello(http:Caller caller, http:Request req) {
    // io:println(req.getHeaderNames().toJsonString());
    // var timestamp = time:currentTime().time;
    var timestamp = time:nanoTime() / 1000;
    var result = caller->respond({time: timestamp});

    if (result is error) {
        log:printError("Error sending response", result);
    }
  }
}