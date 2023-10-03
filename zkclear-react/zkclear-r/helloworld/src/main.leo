// The 'helloworld' program.
program helloworld.aleo {
transition main(public a1: address, public a2: address, public a3: address,  addrtocheck: address) -> bool {
        return (a1 == addrtocheck || a2 == addrtocheck || a3 == addrtocheck);
        //return check_in_pdf(fill_address_list(), addrtocheck);
    }
}
