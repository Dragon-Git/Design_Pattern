// Iterator pattern in systemverilog
virtual class iterator;
    pure virtual function int next();
    pure virtual function bit hasNext();
endclass

virtual class container;
    pure virtual function iterator getiterator();
endclass

class listiterator extends iterator;
    int index;
    int list[];
    function new();
        this.index = 0;
        this.list = '{1,2,3,4,5};
    endfunction
    function int next();
        int value = this.list[this.index];
        this.index = this.index + 1;
        return value;
    endfunction
    function bit hasNext();
        return this.index < this.list.size();
    endfunction
endclass

class list extends container;
    function int get(int index);
        return get(index);
    endfunction
    function iterator getiterator();
        listiterator li = new;
        return li;
    endfunction
endclass

module iterator;
    list l;
    iterator li;
    int value;
    initial begin
        l = new;
        li = l.getiterator();
        while (li.hasNext()) begin
            value = li.next();
            $display("%d", value);
        end
    end
endmodule