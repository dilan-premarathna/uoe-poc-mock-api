import ballerina/http;

// Read the employees JSON file
type EmployeeData record {
    string employeeId;
    string address;
    string department;
    int servicePeriod;
    int salary;
};

EmployeeData[] employeesData = [
    {
        "employeeId": "E001",
        "address": "123 Main St",
        "department": "IT",
        "servicePeriod": 5,
        "salary": 50000
    },
    {
        "employeeId": "E002",
        "address": "456 Elm St",
        "department": "HR",
        "servicePeriod": 10,
        "salary": 150000
    }
];

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
