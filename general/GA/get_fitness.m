function pred=get_fitness(value)
%定义适应性评估函数，用户评估种群中的个体的好坏（好坏指标自己定义）
    pred=value+1e-3-min(value);
end
