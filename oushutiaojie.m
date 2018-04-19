function A=oushutiaojie(A)
N=500;
B=find(A(:,N)>0);
[h,~]=size(B);
disp(['h的值为：',num2str(h)]);%调试
e=1;
while e<=h
dian1=randi([1,N]);%随机取一个点进行连线
c=0;
if A(dian1,1)~=0 && A(A(dian1,1),1)~=0
for j=1:40
    if A(B(e,1),j)==dian1%查看这个是否是已经连接过的点
       c=c+1;
    end
    if A(B(e,1),j)==A(dian1,1)%检查在A(dian1,1)中是否存在重点
        c=c+1;
    end
end
if c==0 %若满足上述条件，则开始断开并连线
    A(B(e,1),A(B(e,1),N))=dian1;
    A(B(e,1),A(B(e,1),N)-1)=A(dian1,1);
    
    [~,d]=find(A(A(dian1,1),1:40)==dian1);
    A(A(dian1,1),d)=B(e,1);
    A(dian1,1)=B(e,1);
    A(B(e,1),N)= A(B(e,1),N)-2;%将相应的度减2
    
    if A(B(e,1),N)==0
        e=e+1;%结束条件
    end
end
end
end