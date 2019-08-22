function pop1=select(pop,pred,POP_SIZE)
%定义选择函数，选择父方和母方进行交配，适应度越高的越容易被选择到
  p=zeros(1,POP_SIZE);
  p=pred/sum(pred);
%   a=1:1:100;
%  idx=randsrc(1,POP_SIZE,[a;p]);
%  pop= pop(idx,:);
  p_sort=sort(p,'descend');
  idx=zeros(1,POP_SIZE);
  idx1=zeros(1,POP_SIZE);
  for i=1:100
      idx_arr=find(p==p_sort(i));
      idx(i)=idx_arr(1);
  end
  idx1=repmat(idx(1:50),1,2);
  pop1=pop(idx1,:);
end