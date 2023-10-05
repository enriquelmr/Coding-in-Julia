
function iterar(g,x0,e)
      f=g(x0)
    v=[x0,f]
    d=1
    f0=x0
    while e<d
        f=f0
        f0=g(f)
        push!(v,f0)
        if d >= 10.0^6 # si la distancia entre un iterado y el siguiente es demasiado grande se interrumpe
                               # el ciclo, pues de lo contrario el ciclo podrÃ­a continuar para siempre.
            println("La iteraciÃ³n no converge")
            break
        end
        d=norm(f-f0)
        #f_viejo=f_nuevo
    end
    plot(v)
    return v

end

function l(x0,j,x)
     pol=1
    for i in 1:length(x)
       
        if i != j
            pol*=(x0-x[i])/(x[j]-x[i])
        end
end
            return pol


end

function interpolar(x,y)

 function L(p)
        aux = [l(p, i, x) for i in 1:length(y)]
        return dot(aux, y)
    end
    return L     
end
function paso_euler(f,x,t,h) 
    return     x+f(x,t)*h
end
function euler(f,x0,t0,tf,h)
    #if(length(f(x0,1))==length(x0))
   
    t = t0:h:tf
    m=length(x0)
    n=length(t)
    x=zeros((n,m))
    x[1,:]=x0
    for i in 2:length(t)
            x[i,:]=paso_euler(f,x[i-1,:],t[i-1],h)#despues de tratar bastantes casos
                                  #me di cuenta que al mandar la funcion como vector y
                        # x como vector marca error  si se manda x como Int64 
        end
  
    return t,x
end
