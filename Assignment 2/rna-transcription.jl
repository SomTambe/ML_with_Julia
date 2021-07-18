# submit
function to_rna(dna)
    if(length(dna)==0) 
        return dna
    end
    flag=1
    if(length(dna)!=0)
        arr=split(dna, "")
        for i=1:length(arr)
            if(arr[i]=="A")
                arr[i]="U"
            else
                if(arr[i]=="C")
                    arr[i]="G"
                else
                    if(arr[i]=="T")
                        arr[i]="A"
                    else
                        if(arr[i]=="G")
                        arr[i]="C"
                        else
                            flag=0
                            break
                        end
                    end
                end
            end
        end
    end
    if(flag==1)
        return join(arr)
    else
        throw(ErrorException("invalid input"))
    end
end
