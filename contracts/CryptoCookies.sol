pragma solidity 0.4.18;
contract CryptoCookies {
    uint public adIndex; 
    
    
    struct AdSpace {
        address creator;
        uint id;
        string websiteName;
        uint pixelWidth;
        uint pixelHeight;
        uint clicks;
    }
    
    function CryptoCookies() public{
        adIndex = 0;
    }
    
    
    AdSpace[] public adSpaces;
    function createAdSpace(string _websiteName, uint _pixelWidth, uint _pixelHeight) public returns(uint index){
        adIndex ++;
        adSpaces.push(AdSpace(msg.sender, adIndex, _websiteName, _pixelWidth, _pixelHeight, 0));
       return adIndex;    
    }

    function getAdSpace(uint _id) public view returns(string, uint) {
        AdSpace storage thisAd =  adSpaces[_id];
        return (thisAd.websiteName, thisAd.clicks);
         
    }

    function adClicked(uint _id) public  {
        adSpaces[_id].clicks ++;
    }
     
}