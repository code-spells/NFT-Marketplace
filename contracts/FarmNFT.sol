// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/tokens/ERC721/extensions/ERC21URIStorage.sol";
import "@openzeppelin/contracts/tokens/ERC721/ERC721.sol";
import "hardhat/console.sol";
contract FarmNFT is ERC21URIStorage{
    struct Counters{
        uint256 counter;
    }
    uint256 public listingPrice = 0.0015 ether;
    Counters.counter private _tokenID;
    Counters.counter private _itemsSold;
    address payable owner;
    
    modifier onlyOwner{
        require(msg.sender==owner,"you are not owner");
        _;
    }

    struct MarketItem{
        uint256 tokenID;
        address payable Seller;
        address payable owner;
        uint256 price;
        bool sold;
    }
    mapping (uint256 => MarketItem) private idMarketItem;

    event MarketItemCreated(uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    constructor () ERC721("kissan-nft","KSNNFT"){
        owner == payable(msg.sender);
    }

    function updateListingPrice(uint256 _listingPrice) public payable onlyOwner {
            listingPrice = _listingPrice;
    }

    // function checkListingPrice () public view returns (uint256){
    //     return listingPrice;
    // }

    //creating nft token function

    
}