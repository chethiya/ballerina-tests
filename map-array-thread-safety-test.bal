import ballerina/io;
// int[] count = [0];
int[] arr = [];
map<int> m = {};
type Record record {|
  int value;
|};
// Record r = {value: 0};
// map<int> r = {value: 0};
public function main() {
  // int count = 0;
  int N = 10000;

  var counter = function(int offset) {
    int i=0;
    while (i < N) {
      // lock {
      arr.push(i);
      int key = i*2 + offset;
      m[key.toString()] = i;
      // }
      i += 1;
    }
  };

  worker w1 {
    counter(0);
  }

  worker w2 {
    counter(1);
  }
  _ = wait {w1, w2};
  io:println("Array length should be ", N*2, " but is ", arr.length());
  int sum = 0;
  m.forEach(function(int v) {
    sum += v;
  });
  int expectedSum = (N-1) * N;
  io:println("Map size is ", m.length(), " and sum of values is ", sum, " and is expected to be ", expectedSum);
}