# Define the Tensor struct
struct Tensor{T}
    data::Array{T}
    shape::Tuple{Int64, Vararg{Int64}}
end

# Constructor to create a Tensor from an array
function Tensor(data::Array{T}) where T
    shape = size(data)
    return Tensor{T}(data, shape)
end

# Constructor to create a Tensor with specific shape and fill value
function Tensor{T}(shape::Tuple{Vararg{Int64}}, fill_value::T) where T
    data = fill(fill_value, shape...)
    return Tensor{T}(data, shape)
end

# Overload the show method for pretty printing
Base.show(io::IO, t::Tensor) = print(io, "Tensor of shape ", t.shape, " with data:\n", t.data)

# Element-wise addition
function +(a::Tensor, b::Tensor)
    if a.shape != b.shape
        throw(DimensionMismatch("Tensors must have the same shape for addition"))
    end
    return Tensor(a.data .+ b.data)
end

# Element-wise multiplication
function *(a::Tensor, b::Tensor)
    if a.shape != b.shape
        throw(DimensionMismatch("Tensors must have the same shape for multiplication"))
    end
    return Tensor(a.data .* b.data)
end

# Reshape the Tensor
function reshape(t::Tensor, new_shape::Tuple{Vararg{Int64}})
    new_data = reshape(t.data, new_shape...)
    return Tensor(new_data)
end

# Access elements
function getindex(t::Tensor, inds...)
    return t.data[inds...]
end

# Set elements
function setindex!(t::Tensor, value, inds...)
    t.data[inds...] = value
end

# Example usage
# Create a 2x3 Tensor filled with zeros
t1 = Tensor((2, 3), 0.0)
println(t1)

# Create a Tensor from an existing array
arr = [1.0 2.0 3.0; 4.0 5.0 6.0]
t2 = Tensor(arr)
println(t2)

# Element-wise addition
t3 = t1 + t2
println("After addition:\n", t3)

# Element-wise multiplication
t4 = t2 * t2
println("After multiplication:\n", t4)

# Reshape the tensor
t5 = reshape(t4, (3, 2))
println("After reshaping:\n", t5)

# Access and set elements
println("Element at (1, 2): ", t5[1, 2])
t5[1, 2] = 99.0
println("After setting element at (1, 2):\n", t5)
