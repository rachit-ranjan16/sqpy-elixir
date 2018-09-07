defmodule SqPy.Registry do
    use GenServer
    @doc """
    Starts the Registry
    """
    def start_link(opts) do
        GenServer.start_link(__MODULE__,:ok, opts)
    end

    @doc """
    Looks up a actor pid for `name` stored in `server`
    Returns `{:ok, pid}` if found else error
    """
    def lookup(server, name) do
        GenServer.call(server, {:lookup, name})
    end

    @doc """
    Creates an actor associated with `name` in the server  
    """
    def create(server, name) do
        GenServer.cast(server, {:create, name})
    end
    # Server Callbacks
    def init(:ok) do
        
    end

    def handle_call({:lookup, name}, _from, names) do
        
    end

    def handle_cast({:create, name}, names) do
        
    end

end