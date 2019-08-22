function child_mutation=mutate(child,MUTATION_RATE,DNA_SIZE)
  for i=1:DNA_SIZE
     if rand(1)<MUTATION_RATE      
         child(i)=1-child(i);  
     end
  end
  child_mutation=child;
end