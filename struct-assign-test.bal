import ballerina/io;

type Record record {
  int age;
};
map<Record> m = {};


public function test() {
  Record t = {
    age: 40
  };
  m["test"] = t;
  io:println(t === m["test"]);
}

public function main() {
  Record a = {
    age: 30
  };
  Record b = {
    age: 30
  };
  Record c = a;
  io:println(a===b);
  io:println(a===c);

  m["a"] = a;
  Record d = <Record>m["a"];
  io:println(a===d);

  test();
  io:println(<Record>m["test"]);
}