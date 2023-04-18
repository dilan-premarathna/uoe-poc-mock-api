import ballerina/http;
import ballerina/log;
import ballerina/random;

type Employee record {
    string id;
    string name;
    int age;
    string address;
    int salary;
    boolean process;
};

service / on new http:Listener(9090) {

    resource function get empUpdate() returns Employee|error {

        Employee emp = {name: "John", age: 30, address: "NY", salary: 3000, process: false, id: "E001"};
        return updateEmployee(emp);
    }
}

function updateEmployee(Employee emp) returns Employee|error {

    int randomInt = check random:createIntInRange(1, 3);
    boolean randomBoolean = randomInt == 1 ? true : false;
    log:printInfo("Randomly generated boolean: " + randomInt.toHexString() + " = " + randomBoolean.toString()
    + " for employee: " + emp.name);

    emp.process = randomBoolean;
    return emp;
}

