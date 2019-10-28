import ballerina/cache;
import ballerina/io;
import ballerina/time;
// import ballerina/runtime;
public function main() {
  var time = time:currentTime();
  var nano = time:nanoTime();
  io:println(time.time);
  io:println(nano);
  cache:Cache cache = new(60000, 5);
  int i=0;
  int sum = 0;
  while (i < 1000) {
    // runtime:sleep(1);
    string key = i.toString();
    cache.put(key, i);
    any? value = cache.get("0");
    if (value is int) {
      sum += value;
    }
    i += 1;
  }
  io:println("sum: ", sum, " - ", cache.keys());
}