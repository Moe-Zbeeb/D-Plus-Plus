struct KNN 
    K :: Int 
    X :: Array{Float64,2}  
    Y :: Array{Float64,1}   
    type :: String  
end 

function KNN(k::INT , type:string) 
    x_train = Array{Float64,2}(undef, 0, 0)    
    y_train = Array{Float64,1}(undef, 0) 
    return KNN(k, x_train, y_train, type)
end 

function fit!(model::KNN, x_train::Array{Float64,2}, y_train::Array{Float64,1}) 
    model.X = x_train 
    model.Y = y_train 
end

function predict(model::KNN, x::Array{Float64,1}) 
    distances = [norm(x - model.X[i,:]) for i in 1:size(model.X,1)] 
    k_indices = partialsortperm(distances, 1:model.k)
    k_nearest = model.Y[k_indices]   
    if model.type == "classification" 
        return mode(k_nearest) 
    else 
        return mean(k_nearest) 
    end
end