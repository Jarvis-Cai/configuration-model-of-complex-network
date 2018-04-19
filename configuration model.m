%ER模型
clc;clear;close all;
for cishu=1:50
N=500;%网络中节点个数
p=0.04;
u=p*500;
for k=1:60
p_k(k)=u^k/factorial(k)*exp(-u);%得到度的分布
p_k(k)=round(p_k(k)*N);%四舍五入
end
p1=p_k;
SA=zeros(N);
a=0;
for i=1:40
    while p_k(i)>0
    a=a+1;
    p_k(i)=p_k(i)-1;
    SA(a,N)=i; %确定每个点的度，并放在第n列
    end
end
SA(498,500)=8;
SA(499,500)=8;
SA(500,500)=8;%由于四舍五入的原因
for i=1:N
    SA(i,N-1)=i;%剩下的点编号
end
% for i=1:N%有多少个点
%     while SA(i,N)>0%每个点的度存储位置
%     dian1=randi([i,N]);%顺序取点并连接
% %     a=0;
% %     for j=1:40
% %         if SA(i,j)==dian1
% %            a=a+1;
% %         end
% %     end
%     if SA(dian1,N)>0 %&& a==0  %判断这个点是否还有度
%         SA(i,SA(i,N))=dian1;
%         SA(dian1,SA(dian1,N))=i;
%         SA(i,N)=SA(i,N)-1;
%         SA(dian1,N)=SA(dian1,N)-1;%每连接一次就减少一次度并记录下来
%     end
%     end
% end
N1=500;%还剩多少个点未连线
d=1;b=0;
while N1>1 && d>0.0001
    dian1=randi([1,N1]);
    dian2=randi([1,N1]);
    b=b+1;
    d=N1/b;
    c=0;
    for j=1:40
        if SA(SA(dian2,N-1),j)==SA(dian1,N-1)
           c=c+1;        end
    end
    if dian1~=dian2 && c==0
        SA(SA(dian1,N-1),SA(SA(dian1,N-1),N))=SA(dian2,N-1);
        SA(SA(dian2,N-1),SA(SA(dian2,N-1),N))=SA(dian1,N-1);%进行连接
        SA(SA(dian2,N-1),N)=SA(SA(dian2,N-1),N)-1;
        SA(SA(dian1,N-1),N)=SA(SA(dian1,N-1),N)-1;%每连接一次就减少一次度并记录下来
    for i=1:N
       if  SA(i,N)==0
           SA(i,N)=-1;%避免再次出栈
           [a,~]=find(SA(:,N-1)==i);
           if a<N1
            for j=a+1:N1
              SA(j-1,N-1)=SA(j,N-1);%统计剩下的点的个数
            end     
             SA(j,N-1)=0;%把最后一个点赋值为零，即将度完成的点出栈          
           else 
             SA(a,N-1)=0;
           end
           N1=N1-1;
           b=0;
       end
    end
    end
  
end
SA1=SA;
if N1>0
SA=shoudongtiaojie(SA,N1);
end
A=zeros(N);
for i=1:N
    for j=1:60
        if SA(i,j)>0
        c=SA(i,j);
        A(i,c)=1; A(c,i)=1;%得到邻接矩阵
        end
    end
end

[~,aver_C]=Clustering_Coefficient(A);
C11(cishu)=aver_C;
%[~,aver_DeD]=Degree_Distribution(A);
[~,aver_D]=Aver_Path_Length(A);
D11(cishu)=aver_D;
end
C12=mean(C11); C13=var(C11);
D12=mean(D11); D13=var(D11);
 disp(['该随机图的平均路径长度均值为：',num2str(D12)]); 
 disp(['该随机图的平均路径长度方差为：',num2str(D13)]);%%输出该网络的特征参数
 disp(['该随机图的聚类系数均值为：',num2str(C12)]);
 disp(['该随机图的聚类系数方差为：',num2str(C13)]);
 %disp(['该随机图的平均度为：',num2str(aver_DeD)]); 