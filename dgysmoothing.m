function y =dgysmoothing(x,win_num,poly_order)
%+++ Guoyu Ding, 6.15, 2019.
% win_num is the window size (7 9 11 13 15 17)
% poly_order is the polynomiar order(2 3 4 5)
[n1,m1]=size(x);
y=zeros(size(x));




if win_num == 7
    if poly_order == 2
        coef1=[-2 3 6 7 6 3 -2]/21;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-2:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    elseif poly_order == 3
        coef1=[-2 3 6 7 6 3 -2]/21;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-2:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    elseif poly_order == 4
        coef1=[5 -30 75 131 75 -30 5]/231;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-2:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    elseif poly_order == 5
        coef1=[5 -30 75 131 75 -30 5]/231;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:3;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-2:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=4:m1-3;
                y(i,j)=coef1(1)*x(i,j-3)+coef1(2)*x(i,j-2)+coef1(3)*x(i,j-1)+coef1(4)*x(i,j)+coef1(5)*x(i,j+1)+coef1(6)*x(i,j+2)+coef1(7)*x(i,j+3);
            end
        end
    end
elseif win_num == 9
    if poly_order == 2
        coef1=[-21 14 39 54 59 54 39 14 -21]/231;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-3:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
        end
    elseif poly_order == 3
        coef1=[-21 14 39 54 59 54 39 14 -21]/231;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-3:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
        end
    elseif poly_order == 4
        coef1=[15 -55 30 135 179 135 30 -55 15]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-3:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
        end
    elseif poly_order == 5
        coef1=[15 -55 30 135 179 135 30 -55 15]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:4;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-3:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=5:m1-4;
                y(i,j)=coef1(1)*x(i,j-4)+coef1(2)*x(i,j-3)+coef1(3)*x(i,j-2)+coef1(4)*x(i,j-1)+coef1(5)*x(i,j)+coef1(6)*x(i,j+1)+coef1(7)*x(i,j+2)+coef1(8)*x(i,j+3)+coef1(9)*x(i,j+4);
            end
        end
    end
elseif win_num == 11
    if poly_order == 2
        coef1=[-36 9 44 69 84 89 84 69 44 9 -36]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-4:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    elseif poly_order == 3
        coef1=[-36 9 44 69 84 89 84 69 44 9 -36]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-4:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    elseif poly_order == 4
        coef1=[18 -45 -10 60 120 143 120 60 -10 -45 18]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-4:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    elseif poly_order == 5
        coef1=[18 -45 -10 60 120 143 120 60 -10 -45 18]/429;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:5;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-4:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=6:m1-5;
                y(i,j)=coef1(1)*x(i,j-5)+coef1(2)*x(i,j-4)+coef1(3)*x(i,j-3)+coef1(4)*x(i,j-2)+coef1(5)*x(i,j-1)+coef1(6)*x(i,j)+coef1(7)*x(i,j+1)+coef1(8)*x(i,j+2)+coef1(9)*x(i,j+3)+coef1(10)*x(i,j+4)+coef1(11)*x(i,j+5);
            end
        end
    end
elseif win_num == 13
    if poly_order == 2
        coef1=[-11 0 9 16 21 24 25 24 21 16 9 0 -11]/143;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-5:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    elseif poly_order == 3
        coef1=[-11 0 9 16 21 24 25 24 21 16 9 0 -11]/143;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-5:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    elseif poly_order == 4
        coef1=[110 -198 -135 110 390 600 677 600 390 110 -135 -198 110]/2431;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-5:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    elseif poly_order == 5
        coef1=[110 -198 -135 110 390 600 677 600 390 110 -135 -198 110]/2431;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:6;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-5:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=7:m1-6;
                y(i,j)=coef1(1)*x(i,j-6)+coef1(2)*x(i,j-5)+coef1(3)*x(i,j-4)+coef1(4)*x(i,j-3)+coef1(5)*x(i,j-2)+coef1(6)*x(i,j-1)+coef1(7)*x(i,j)+coef1(8)*x(i,j+1)+coef1(9)*x(i,j+2)+coef1(10)*x(i,j+3)+coef1(11)*x(i,j+4)+coef1(12)*x(i,j+5)+coef1(13)*x(i,j+6);
            end
        end
    end
elseif win_num == 15
    if poly_order == 2
        coef1=[-78 -13 42 87 122 147 162 167 162 147 122 87 42 -13 -78]/1105;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-6:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    elseif poly_order == 3
        coef1=[-78 -13 42 87 122 147 162 167 162 147 122 87 42 -13 -78]/1105;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-6:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    elseif poly_order == 4
        coef1=[2145 -2860 -2937 -165 3755 7500 10125 11063 10125 7500 3755 -165 -2937 -2860 2145]/46189;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-6:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    elseif poly_order == 5
        coef1=[2145 -2860 -2937 -165 3755 7500 10125 11063 10125 7500 3755 -165 -2937 -2860 2145]/46189;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:7;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-6:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=8:m1-7;
                y(i,j)=coef1(1)*x(i,j-7)+coef1(2)*x(i,j-6)+coef1(3)*x(i,j-5)+coef1(4)*x(i,j-4)+coef1(5)*x(i,j-3)+coef1(6)*x(i,j-2)+coef1(7)*x(i,j-1)+coef1(8)*x(i,j)+coef1(9)*x(i,j+1)+coef1(10)*x(i,j+2)+coef1(11)*x(i,j+3)+coef1(12)*x(i,j+4)+coef1(13)*x(i,j+5)+coef1(14)*x(i,j+6)+coef1(15)*x(i,j+7);
            end
        end
    end
elseif win_num == 17
    if poly_order == 2
        coef1=[-21 -6 7 18 27 34 39 42 43 42 39 34 27 18 7 -6 -21]/323;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-7:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    elseif poly_order == 3
        coef1=[-21 -6 7 18 27 34 39 42 43 42 39 34 27 18 7 -6 -21]/323;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-7:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    elseif poly_order == 4
        coef1=[195 -195 -260 -117 135 415 660 825 883 825 660 415 135 -117 -260 -195 195]/4199;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-7:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    elseif poly_order == 5
        coef1=[195 -195 -260 -117 135 415 660 825 883 825 660 415 135 -117 -260 -195 195]/4199;
        for i=1:n1;
            P1=polyfit([1:win_num],x(i,[1:win_num]),poly_order);
            P2=polyfit([m1-win_num+1:m1],x(i,[m1-win_num+1:m1]),poly_order);
            for j=1:8;
                y(i,j)=polyval(P1,j);
            end
            for j=m1-7:m1;
                y(i,j)=polyval(P2,j);
            end
            for j=9:m1-8;
                y(i,j)=coef1(1)*x(i,j-8)+coef1(2)*x(i,j-7)+coef1(3)*x(i,j-6)+coef1(4)*x(i,j-5)+coef1(5)*x(i,j-4)+coef1(6)*x(i,j-3)+coef1(7)*x(i,j-2)+coef1(8)*x(i,j-1)+coef1(9)*x(i,j)+coef1(10)*x(i,j+1)+coef1(11)*x(i,j+2)+coef1(12)*x(i,j+3)+coef1(13)*x(i,j+4)+coef1(14)*x(i,j+5)+coef1(15)*x(i,j+6)+coef1(16)*x(i,j+7)+coef1(17)*x(i,j+8);
            end
        end
    end
end


