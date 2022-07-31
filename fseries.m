function F=fseries(f,x,n,a,b)
if nargin==3                %������Ϊ����������ȱʡ����ʾf(x)��[-pi,pi]��չ��
    a=-pi;
    b=pi;
end
L=(b-a)/2;
F=int(f,x,-L,L)/2*L;        %int(f,x,-L,L)���Է��ű��ʽ����ź���fΪ����������xΪ���ֱ�����-LΪ���ޣ�LΪ���޼��㶨����
for i=1:n
an=int(f*cos(i*pi*x/L),x,-L,L)/L;
bn=int(f*sin(i*pi*x/L),x,-L,L)/L;
F=F+an*cos(i*pi*x/L)+bn*sin(i*pi*x/L);
end
