`ifndef STATE
`def STATE
// State pattern in systemverilog
typedef class Context;
interface class State;
    pure virtual function void do_action(Context m_context);
    //pure virtual function void next_state(Context m_context);
endclass

class Start implements State;
    virtual function void do_action(Context m_context);
        $display("state name:Start");
        m_context.set_state(this);
    endfunction
endclass
class Stop implements State;
    virtual function void do_action(Context m_context);
        $display("state name:Stop");
        m_context.set_state(this);
    endfunction
endclass

class Context;
    State state;

    function void do_action();
        $display("state name:Stop");
        this.state.do_action(this);
    endfunction
    function void set_state(State state);
        this.state = state;
    endfunction
    function State get_state(State state);
        return this.state;
    endfunction
endclass

module modStateTest;
    Context m_context = new;
    Start start_state = new;
    Stop stop_state= new;

    initial begin
        m_context.set_state(start_state);
        m_context.do_action();
        m_context.do_action();
    end
endmodule
`endif