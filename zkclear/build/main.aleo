program zkclear.aleo;

struct addressList:
    a1 as address;
    a2 as address;
    a3 as address;
    a4 as address;
    a5 as address;

record addrToBeChecked:
    owner as address.private;
    is_allowed as boolean.private;


closure fill_address_list:
    cast aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2 aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2 aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2 aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2 aleo1kkk52quhnxgn2nfrcd9jqk7c9x27c23f2wvw7fyzcze56yahvcgszgttu2 into r0 as addressList;
    output r0 as addressList;


closure check_in_pdf:
    input r0 as addressList;
    input r1 as address;
    is.eq r0.a1 r1 into r2;
    is.eq r0.a2 r1 into r3;
    or r2 r3 into r4;
    is.eq r0.a3 r1 into r5;
    or r4 r5 into r6;
    is.eq r0.a4 r1 into r7;
    or r6 r7 into r8;
    is.eq r0.a5 r1 into r9;
    or r8 r9 into r10;
    output r10 as boolean;


function main:
    input r0 as address.private;
    call fill_address_list into r1;
    call check_in_pdf r1 r0 into r2;
    output r2 as boolean.private;
