function child=crossover(parent,pop,CROSS_RATE)
%生成后代函数
  if rand(1)<CROSS_RATE
      i=randi([1,100],1);
      cross_point=randi([0,1],1,10);
      index=find(cross_point==1);
      parent(index)=pop(i,index);
  end
  child=parent;
end