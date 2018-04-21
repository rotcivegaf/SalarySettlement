# SalarySettlement

Basic contract to pay salaries.

### Only owner funcions ###
* paySalary(): the owner can pay all employees
* addEmployer(address, uint): add an employer with his salary
* changeSalary(address, uint): changes the salary of an employee, by assigning 0 to the salary the employee is deregistered
### Employer funcions ###
* withdraw(uint): any employee can get the desired amount from their account
### Public funcions ###
* getContractBalance(): get the balance of the contract
