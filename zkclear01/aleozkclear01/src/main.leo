// The 'aleozkclear01' program.
program aleozkclear01.aleo {

    struct addrlist:
    a0 as address; a1 as address; a2 as address; a3 as address;
    a4 as address; a5 as address; a6 as address; a7 as address;
    a8 as address; a9 as address; a10 as address; a11 as address;
    a12 as address; a13 as address; a14 as address; a15 as address;

    

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
