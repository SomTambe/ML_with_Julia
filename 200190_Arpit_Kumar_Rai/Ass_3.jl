#Using hand written derivative rules 

function gd(a,b,c)
    x=rand(100)
    x=x.*10
    w1=w2=w3=0
    y=map(x->a*x^2+b*x+c,x)
    while true
        n=1e-4
        gradw1,gradw2,gradw3,loss = 0.0,0.0,0.0,0.0
        for j in 1:length(x)
            z = w1*x[j]^2+w2*x[j]+w3
            gradw1 += (z-y[j])*x[j]^2
            gradw2 += (z-y[j])*x[j]
            gradw3 += (z-y[j])
            loss+=((z-y[j])^2)/2
        end
        w1 = w1 - n*gradw1/length(x)
        w2 = w2 - n*gradw2/length(x)
        w3 = w3 - n*gradw3/length(x)
        loss=loss/length(x)
        if loss<1e-4
            break
        end
    end
    return w1,w2,w3
end


#Using Zygote

using Zygote

cost(w1,w2,w3,x,y) = ((w1*x^2+w2*x+w3-y)^2)/2

function gd2(a,b,c)
    x=rand(100)
    x=x.*10
    w1=w2=w3=0
    y=map(x->a*x^2+b*x+c,x)
    while true
        n=1e-4
        gradw1,gradw2,gradw3,loss = 0.0,0.0,0.0,0.0
        for j in 1:length(x)
            z = w1*x[j]^2+w2*x[j]+w3
            gw1,gw2,gw3,_,_ = gradient(cost,w1,w2,w3,x[j],y[j]) 
            gradw1 += gw1
            gradw2 += gw2
            gradw3 += gw3
            loss+=((z-y[j])^2)/2
        end
        w1 = w1 - n*gradw1/length(x)
        w2 = w2 - n*gradw2/length(x)
        w3 = w3 - n*gradw3/length(x)
        loss=loss/length(x)
        if loss<1e-4
            break
        end
    end
    return w1,w2,w3
end
