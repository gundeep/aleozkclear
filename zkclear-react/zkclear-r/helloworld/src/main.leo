// The 'zkclear' program.
program zkclear.aleo {


// create a function to check if the address is in the list of addresses.
// if the address is in the list of addresses, return false.
// if the address is not in the list of addresses, return true.
// The `address to be checked` record datatype.
    record addrToBeChecked {
        // The token owner.
        owner: address,
        // The token amount.
        isClear: bool,
    }

transition main(public a1: address, 
public a2: address,
public a3: address,
public d1: u64,
addrtocheck: address) -> bool {
        if (d1 < 1696763811802u64){ // Time as of 8th Oct 2023 in Unix Epoch ms.
            return false; // return is time of the file is before the above mentioned date.false
        } 
    
        else if (a1.eq(addrtocheck) || 
        a2.eq(addrtocheck) ||
        a3.eq(addrtocheck)) {
            return false;
        }
        return true;
    }
}