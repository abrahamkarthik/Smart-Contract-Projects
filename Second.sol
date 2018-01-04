pragma solidity ^0.4.18;

contract Owned
{
    address Owner;
    
    function Owned() public{
        Owner=msg.sender;
    }
    
    modifier OnlyOwner {
        require(msg.sender == Owner);
        _;
    }
}

contract Second is Owned {
    struct Instrctor{
    bytes16 Fname;
    bytes16 Lname;
    uint Age;
    }
    mapping(address => Instrctor) Instrctors;
    
    event InstuctorInfo(
         bytes16 Fname,
    bytes16 Lname,
    uint Age
    );
    
    address[] public instructorsAccts;
    function setInstrctor(address _address,bytes16 _fname,bytes16 _lname,uint _age) OnlyOwner public {
        var instuctor = Instrctors[_address];
        instuctor.Age =_age;
        instuctor.Lname =_lname;
        instuctor.Fname =_fname;
        instructorsAccts.push(_address) -1;
        InstuctorInfo(_fname,_lname,_age);
    }
    
    function getInstrctor() view public returns(address[])
    {
        return instructorsAccts;
    }
    
    function getIns(address _address) view public returns(bytes16,bytes16,uint)
    {
        return(Instrctors[_address].Fname,Instrctors[_address].Lname,Instrctors[_address].Age);
    }
    
    function countIns() view public returns(uint)
    {
        return instructorsAccts.length;
    }
}

    