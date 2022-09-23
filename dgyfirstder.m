function y =dgyfirstder(x,win_num,poly_order)
%+++ Guoyu Ding, 6.15, 2019.
% win_num is the window size (5 7 9 11 13 15 17)
% poly_order is the polynomiar order(3)
[n1,m1]=size(x);
y=zeros(size(x));
if win_num == 5
    if poly_order == 3
        coef1=[1 -8 0 8 -1]/12;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:2;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-1:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=3:m1-2;
                y(i,j)=coef1(1)*x(i,j-2)+coef1(2)*x(i,j-1)+coef1(3)*x(i,j)+coef1(4)*x(i,j+1)+coef1(5)*x(i,j+2);
            end
        end
    end
elseif win_num == 7
    if poly_order == 3
        coef1=[22 -67 -58 0 58 67 -22]/252;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-2:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    end
elseif win_num == 9
    if poly_order == 3
        coef1=[86 -142 -193 -126 0 126 193 142 -86]/1188;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-3:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
            
        end
    end
elseif win_num == 11
    if poly_order == 3
        coef1=[300 -294 -532 -503 -296 0 296 503 532 294 -300]/5148;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-4:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    end
elseif win_num == 13
    if poly_order == 3
        coef1=[1133 -660 -1578 -1796 -1489 -832 0 832 1489 1796 1578 660 -1133]/24024;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-5:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    end
elseif win_num == 15
    if poly_order == 3
        coef1=[12922 -4121 -14150 -18334 -17842 -13843 -7506 0 7506 13843 17842 18334 14150 4121 -12922]/334152;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-6:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    end
elseif win_num == 17
    if poly_order == 3
        coef1=[748 -98 -643 -930 -1002 -902 -673 -358 0 358 673 902 1002 930 643 98 -748]/23256;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=diff([polyval(P1,(j-1)),polyval(P1,(j+1))])/2;
            end
            for j=m1-7:m1;
                y(i,j)=diff([polyval(P2,(j-1)),polyval(P2,(j+1))])/2;
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    end
end


