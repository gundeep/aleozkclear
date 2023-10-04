// The 'helloworld' program.
program helloworld.aleo {
transition main(public a1: address, public a2: address, public a3: address,  addrtocheck: address) -> bool {
    assert_eq(a1, a2);
        return false;
        //return check_in_pdf(fill_address_list(), addrtocheck);
    }
}