// Adapter pattern in systemverilog
virtual class target;
    pure virtual function void charge();
    pure virtual function void transfer();
endclass

class usb_a;
    function void charge_a();
        $display("charging usb_a");
    endfunction
    function void transfer_a();
        $display("transferring usb_a");
    endfunction
endclass

class usb_a2c_adapter extends target;
    usb_a usb_a_inst = new();

    function void charge();
        usb_a_inst.charge_a();
        $display("charging usb_a2c ...");
    endfunction
    function void transfer();
        usb_a_inst.transfer_a();
        $display("transferring usb_a2c ...");
    endfunction
endclass

module adapter;
    initial begin
        usb_a usb_a_inst;
        usb_a2c_adapter usb_a2c_adapter_inst;
        usb_a2c_adapter_inst = new();
        usb_a2c_adapter_inst.charge();
        usb_a2c_adapter_inst.transfer();
    end
endmodule
