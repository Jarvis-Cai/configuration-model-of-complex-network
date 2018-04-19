function A=shoudongtiaojie(A,b)
c=1;N=500;
disp(['b的值为：',num2str(b)]);%调试
if b>=2
for i=1:b%一共有b个未配对的点
    if mod(A(A(i,N-1),N),2)%找到度为基数的点
        a(c,1)=A(i,N-1);%哪两个点，然后存起来a1,a2
        disp(['a(c)的值为：',num2str(a(c))]);%调试
        c=c+1;
    end
end
disp(['c的值为：',num2str(c)]);%调试
if c==3%如果有两个基数点
[~,a(3)]=find(A(a(1),1:40)==a(2));%找到两个基数点的在行数中的具体位置a3为a1中要替换的位置
[~,a(4)]=find(A(a(2),1:40)==a(1));%a2对应于a4
disp(['a(3)的值为：',num2str(a(3))]);%调试
disp(['a(4)的值为：',num2str(a(4))]);%调试
%解决孤立的度为基数的情况
e=1;
while e<3
dian1=randi([1,N]);%随机取一个点进行连线
c=0;
if A(dian1,1)~=0 && A(A(dian1,1),1)~=0
for j=1:40
    if A(a(e),j)==dian1%查看这个是否是已经连接过的点
       c=c+1;
    end
    if A(a(e),j)==A(dian1,1)%检查在A(dian1,1)中是否存在重点
        c=c+1;
    end
end
if c==0 %若满足上述条件，则开始断开并连线
    A(a(e),a(e+2))=dian1;
    A(a(e),A(a(e),N))=A(dian1,1);
    [~,d]=find(A(A(dian1,1),1:40)==dian1);
    A(A(dian1,1),d)=a(e);
     A(dian1,1)=a(e);
    A(a(e),N)= A(a(e),N)-1;%将相应的度减1
    e=e+1;%结束
    disp(['e的值为：',num2str(e)]);%调试
end
end
end
elseif c==5%此时有a1-4个点，分别找到这3个点
    disp(['c的值为：',num2str(c)]);%调试
    [~,a(1,2)]=find(A(a(1,1),1:40)==a(2,1));%找到互联的4点，解开
    [~,a(1,3)]=find(A(a(1,1),1:40)==a(3,1));
    [~,a(1,4)]=find(A(a(1,1),1:40)==a(4,1));
    [~,a(2,2)]=find(A(a(2,1),1:40)==a(1,1));%找到互联的4点，解开
    [~,a(2,3)]=find(A(a(2,1),1:40)==a(3,1));
    [~,a(2,4)]=find(A(a(2,1),1:40)==a(4,1));
    [~,a(3,2)]=find(A(a(3,1),1:40)==a(2,1));%找到互联的4点，解开
    [~,a(3,3)]=find(A(a(3,1),1:40)==a(1,1));
    [~,a(3,4)]=find(A(a(3,1),1:40)==a(4,1));
    [~,a(4,2)]=find(A(a(4,1),1:40)==a(2,1));%找到互联的4点，解开
    [~,a(4,3)]=find(A(a(4,1),1:40)==a(3,1));
    [~,a(4,4)]=find(A(a(4,1),1:40)==a(1,1));
    disp(a);%调试
    for i=1:4
        for j=2:4
        A(a(i,1),a(i,j))=0;
        end
    end
    
    for i=1:4
       for j=2:4
        e1=find(A(a(i,1),1:40)>0);
        A(a(i,1),a(i,j))=A(a(i,1),e1(1));%将0往前移动
        A(a(i,1),e1(1))=0;
       end
       A(a(i,1),N)=A(a(i,1),N)+3;
    end
    
     end
end

    A=oushutiaojie(A);
    
