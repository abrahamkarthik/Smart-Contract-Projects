pragma solidity ^0.4.18;

contract First {
    string name;
    uint age;
    address owner;
    event Instructor(
        string name,
        uint age
        );
        
        function First() public {
            owner = msg.sender;
        }
        modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
    function setInstructor(string _name,uint _age) onlyOwner public {
        name=_name;
        age=_age;
        Instructor(_name,_age);
    }
    function getInstructor() public constant returns(string,uint)
    {
        return(name,age);
    }
}