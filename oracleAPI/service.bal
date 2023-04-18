import ballerina/http;
import ballerina/io;

// Read the employees JSON file
type EmployeeData record {
    string employeeId;
    string address;
    string department;
    int servicePeriod;
    int salary;
};

json jsonContent = check io:fileReadJson("./employees.json");

EmployeeData[] employeesData = check jsonContent.cloneWithType();

//EmployeeData[] readJson = check io:fileReadJson("./employees.json");
//io:println (readJson) ;

service / on new http:Listener(9090) {
    resource function get salaries/[string employeeId]() returns EmployeeData|error {
        // Search for the employee with the given employeeId
        foreach var employee in employeesData {
            if employee.employeeId == employeeId {
                return employee;
            }
        }
        // If the employeeId is not found, return an error
        return error("Employee not found");
    }
}
