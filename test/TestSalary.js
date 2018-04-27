var SalarySettlement = artifacts.require("./SalarySettlement.sol");

contract('SalarySettlement', function(accounts) {
  let testSalary;

  beforeEach("Deploy SalarySettlement", async function(){
    testSalary = await SalarySettlement.new();
  });

  it("should put 10000 MetaCoin in the first account", function() {

  });

  afterEach(function() {
    
  });
});
