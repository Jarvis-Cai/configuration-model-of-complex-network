%ERģ��
clc;clear;close all;
for cishu=1:50
N=500;%�����нڵ����
p=0.04;
u=p*500;
for k=1:60
p_k(k)=u^k/factorial(k)*exp(-u);%�õ��ȵķֲ�
p_k(k)=round(p_k(k)*N);%��������
end
p1=p_k;
SA=zeros(N);
a=0;
for i=1:40
    while p_k(i)>0
    a=a+1;
    p_k(i)=p_k(i)-1;
    SA(a,N)=i; %ȷ��ÿ����Ķȣ������ڵ�n��
    end
end
SA(498,500)=8;
SA(499,500)=8;
SA(500,500)=8;%�������������ԭ��
for i=1:N
    SA(i,N-1)=i;%ʣ�µĵ���
end
% for i=1:N%�ж��ٸ���
%     while SA(i,N)>0%ÿ����Ķȴ洢λ��
%     dian1=randi([i,N]);%˳��ȡ�㲢����
% %     a=0;
% %     for j=1:40
% %         if SA(i,j)==dian1
% %            a=a+1;
% %         end
% %     end
%     if SA(dian1,N)>0 %&& a==0  %�ж�������Ƿ��ж�
%         SA(i,SA(i,N))=dian1;
%         SA(dian1,SA(dian1,N))=i;
%         SA(i,N)=SA(i,N)-1;
%         SA(dian1,N)=SA(dian1,N)-1;%ÿ����һ�ξͼ���һ�ζȲ���¼����
%     end
%     end
% end
N1=500;%��ʣ���ٸ���δ����
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
        SA(SA(dian2,N-1),SA(SA(dian2,N-1),N))=SA(dian1,N-1);%��������
        SA(SA(dian2,N-1),N)=SA(SA(dian2,N-1),N)-1;
        SA(SA(dian1,N-1),N)=SA(SA(dian1,N-1),N)-1;%ÿ����һ�ξͼ���һ�ζȲ���¼����
    for i=1:N
       if  SA(i,N)==0
           SA(i,N)=-1;%�����ٴγ�ջ
           [a,~]=find(SA(:,N-1)==i);
           if a<N1
            for j=a+1:N1
              SA(j-1,N-1)=SA(j,N-1);%ͳ��ʣ�µĵ�ĸ���
            end     
             SA(j,N-1)=0;%�����һ���㸳ֵΪ�㣬��������ɵĵ��ջ          
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
        A(i,c)=1; A(c,i)=1;%�õ��ڽӾ���
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
 disp(['�����ͼ��ƽ��·�����Ⱦ�ֵΪ��',num2str(D12)]); 
 disp(['�����ͼ��ƽ��·�����ȷ���Ϊ��',num2str(D13)]);%%������������������
 disp(['�����ͼ�ľ���ϵ����ֵΪ��',num2str(C12)]);
 disp(['�����ͼ�ľ���ϵ������Ϊ��',num2str(C13)]);
 %disp(['�����ͼ��ƽ����Ϊ��',num2str(aver_DeD)]); 