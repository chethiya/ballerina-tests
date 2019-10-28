import ballerina/io;
public function takeSum() {
        int n = 10000000;
        int sum = 0;
        int i = 0;
        while (i < n) {
            sum += i;
            i += 1;
        }
        io:println("sum of first ", n, " positive numbers = ", sum);
}
public function main() {
    io:println("Worker execution started");
    worker w1 {
      takeSum();
    }
    worker w3 {
      takeSum();
    }
    worker w2 {
        int n = 10000000;
        int sum = 0;
        int i=0;
        while (i < n) {
            sum += i * i;
            i += 1;
        }
        io:println("sum of squares of first ", n,
            " positive numbers = ", sum);
    }
    _ = wait {w1, w2, w3};
    io:println("Worker execution finished");
}
