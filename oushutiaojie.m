function A=oushutiaojie(A)
N=500;
B=find(A(:,N)>0);
[h,~]=size(B);
disp(['h��ֵΪ��',num2str(h)]);%����
e=1;
while e<=h
dian1=randi([1,N]);%���ȡһ�����������
c=0;
if A(dian1,1)~=0 && A(A(dian1,1),1)~=0
for j=1:40
    if A(B(e,1),j)==dian1%�鿴����Ƿ����Ѿ����ӹ��ĵ�
       c=c+1;
    end
    if A(B(e,1),j)==A(dian1,1)%�����A(dian1,1)���Ƿ�����ص�
        c=c+1;
    end
end
if c==0 %������������������ʼ�Ͽ�������
    A(B(e,1),A(B(e,1),N))=dian1;
    A(B(e,1),A(B(e,1),N)-1)=A(dian1,1);
    
    [~,d]=find(A(A(dian1,1),1:40)==dian1);
    A(A(dian1,1),d)=B(e,1);
    A(dian1,1)=B(e,1);
    A(B(e,1),N)= A(B(e,1),N)-2;%����Ӧ�Ķȼ�2
    
    if A(B(e,1),N)==0
        e=e+1;%��������
    end
end
end
end