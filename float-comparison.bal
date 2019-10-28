import ballerina/io;
import ballerina/math;
public function main() {
  float a = math:sqrt(-2.0);
  float b = a;
  io:println(a);
  io:println(b);
  io:println(a==b);
}