import ballerina/time;
import ballerina/io;

public function main() {
  int j = 0;
  while (j < 100) {
    int timesum = 0;
    var startTime = time:currentTime().time;
    int i=0;
    while (i<10000000) {
      timesum += time:currentTime().time;
      i += 1;
    }
    var endTime = time:currentTime().time;
    io:println(timesum, "Time for currentTime() ", endTime - startTime);

    startTime = time:currentTime().time;
    i=0;
    timesum = 0;
    while (i<10000000) {
      timesum += time:nanoTime();
      i += 1;
    }
    endTime = time:currentTime().time;
    io:println(timesum, "Time for nanoTime() ", endTime - startTime);

    j += 1;
  }
}