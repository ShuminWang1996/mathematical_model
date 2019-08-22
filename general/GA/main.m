function [pop,max_pop,max1,F_value]=main()
POP_SIZE=100;
DNA_SIZE=10;
MUTATION_RATE=0.003;
CROSS_RATE=0.8;
N_GENERATION=50;
len=5;
x=0:0.01:len;
f=fun(x);
hold on
plot(x,f);
pop=randi([0,1],POP_SIZE,DNA_SIZE);
for i=1:N_GENERATION
    pop_dec=translate_DNA(pop,len,DNA_SIZE);
    F_value=fun(pop_dec);
    pred=get_fitness(F_value);   
    pred_T=pred';
    pop=select(pop,pred_T,POP_SIZE);
    scatter(pop_dec,F_value,"filled");
    axis([0 5 -10 8])
    pause(0.05);
    pop1=pop;
    for j=1:100
        parent=pop(j,:);
        child=crossover(parent,pop1,CROSS_RATE);
        child_mutation=mutate(child,MUTATION_RATE,DNA_SIZE);
        pop(j,:)=child_mutation;
    end
end
%scatter(pop_dec,F_value,"filled");
max1=find(pred==max(pred));
max_pop=pop(max1(1),:);
end