pragma solidity ^0.4.19;

import "./ownable.sol";
import "./safemath.sol";


contract SalarySettlement is Ownable {

    using SafeMath for uint256;

    event PaidSalaries(address employerAddr, uint amount, uint payTime);

    struct Employer {
        uint balance;
        uint salary;
    }

    Employer[] public employers;

    mapping (address => uint) public addressToIndexEmployers;

    function paySalary() public payable onlyOwner() {
        uint totalSalary = 0;
        for (uint i = 0; i < employers.length; i++) {
            totalSalary += employers[i].salary;
        }
        require(msg.value == totalSalary);

        for (i = 0; i < employers.length; i++) {
            employers[i].balance = employers[i].balance.add(employers[i].salary);
        }
    }

    function addEmployer(address _addressEmployer, uint _salary) public onlyOwner() {
        addressToIndexEmployers[_addressEmployer] = employers.push(Employer(0, _salary)) - 1;
    }

    function changeSalary(address _addressEmployer, uint _newSalary) public onlyOwner() {
        employers[addressToIndexEmployers[_addressEmployer]].salary = _newSalary;
    }

    function withdraw(uint _amount) public {
        require(employers[addressToIndexEmployers[msg.sender]].balance >= _amount);

        employers[addressToIndexEmployers[msg.sender]].balance =
            employers[addressToIndexEmployers[msg.sender]].balance.sub(_amount);

        msg.sender.transfer(_amount);
        PaidSalaries(msg.sender, _amount, now);
    }

    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
