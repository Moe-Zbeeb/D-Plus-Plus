# Define the Value struct as mutable
mutable struct Value
    data::Any
    grad::Float64
    _backward::Function
    _prev::Set{Any}
    _op::String

    # Inner constructor to handle initialization similar to Python's __init__
    function Value(data, _children=(), _op="")
        grad = 1.0 
        _backward = () -> nothing
        _prev = Set(_children)
        return new(data, grad, _backward, _prev, _op)
    end   
end

# Overload the + operator
function Base.:+(a::Value, b::Value)
    new_data = a.data + b.data
    new_value = Value(new_data, (a, b), "+")
    
    function bl_plus()
        a.grad += 1
        b.grad += 1
    end
    
    new_value._backward = bl_plus
    
    return new_value
end

# Function to test the struct and overloaded operator
function test_value_struct()
    a = Value(2.0)
    b = Value(3.0)
    
    c = a + b
    
    println("c.data: ", c.data)  # Should print 5.0
    println("c.grad: ", c.grad)  # Should print 0.0 initially
    
    # Call backward function to update gradients
    c._backward()
    
    println("a.grad after c._backward(): ", a.grad)  # Should print 1.0
    println("b.grad after c._backward(): ", b.grad)  # Should print 1.0
end

# Run the test
test_value_struct()
