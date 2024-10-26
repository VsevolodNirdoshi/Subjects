values = [20, 28]
i = 1
if (values[1]%2 == 0) && (values[2]%2 == 0)
  values[1] = values[1]/2
  values[2] = values[2]/2
  println(values)

  while i <= 1000 
    push!(values, values[i]%values[i+1])
    if values[i+2] == 0
        println("НОД:", 2*values[i+1])
        break
    else
      global i += 1
    end
  end
elseif (values[1]%2 != 0) && (values[2]%2 == 0)
  values[2] = values[2]/2
  println(values)
  while i <= 1000 
    push!(values, values[i]%values[i+1])
    if values[i+2] == 0
        println("НОД:", values[i+1])
        break
    else
      global i += 1
    end
  end
elseif (values[1]%2 != 0) && (values[2]%2 != 0)
  values[1] = values[1]-values[2]
  println(values)
  while i <= 1000 
    push!(values, values[i]%values[i+1])
    if values[i+2] == 0
        println("НОД:", values[i+1])
        break
    else
      global i += 1
    end
  end
elseif values[1] == values[2]
  println("НОД:", values[1])
end