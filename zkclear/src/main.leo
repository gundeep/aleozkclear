

// The 'zkclear' program.
program zkclear.aleo {

    struct addressList {
        a1 : address,
        a2 : address,
        a3 : address,
        a4 : address,
        a5 : address
    }

    function fill_address_list () -> addressList {
        
        return addressList { 
        a1: aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2, 
        a2 : aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2,
        a3 : aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2,
        a4 : aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2,
        a5 : aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2
        };
    }

    function check_in_pdf (al: addressList , addr1: address) -> bool {
        return (al.a1 == addr1 || al.a2 == addr1 || al.a3 == addr1 || al.a4 == addr1 || al.a5 == addr1);
    }

    transition main(addrtocheck: address) -> bool {
        return check_in_pdf(fill_address_list(), addrtocheck);
    }

    // Wallet Address to be checked
    // - `owner`     : The address of the account that needs to be verfied.
    // - `is_winner` : Whether the account is clear.
    record addrToBeChecked {
        owner: address,
        is_allowed: bool,
    }
}
