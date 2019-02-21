pragma solidity ^0.5.4;
contract Hospital{
    
    constructor() public{
        
    }
    mapping(address =>uint) patientDirectory;
    event PatEnrollLog(address add,string name,uint age,uint mobileNumber);
    event PatDocLog(address docAdd,string prescription,address patient);
    event PatPhrmLog(address add,string name,uint price, address add1);
    uint count =0;
    address current;
    
    function enroll(string memory name, uint age,uint mobileNumber) public returns(uint){
        current=msg.sender;
        require(patientDirectory[current]==0);
        require(age!=0);require(mobileNumber!=0);
        emit PatEnrollLog(current,name,age,mobileNumber);
        patientDirectory[current]=++count;
        return count;   
    }
    
    function visitDoctor(address add,string memory prescription) public {
        // require(add!="");
        current=msg.sender;
        emit PatDocLog(add,prescription,current);
    }
    
    function visitPharmacy(address add,string memory medicine, uint price) public{
        current=msg.sender;
        emit PatPhrmLog(add,medicine,price,current);
    }
    
    
}
