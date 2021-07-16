function [O,psum,p2sum,ptsum] = templateMatch(I, template, showImgs)
load myposnegmapblk.txt
load myposmapblk.txt

[n,p]=size(I);
nx=sqrt(n); ny=nx;

limMin=0; limMax=200;

[O,psum,p2sum,ptsum] = MyCorr(I,template);
Omax=max(max(O));
[indy,indx]=find(O==Omax);

[a,b]=size(template);
if showImgs == 1
    % display pixel sums
    figure;
    imagesc(psum)%,[0,a*b*limMax])
    %axis image, colormap(myposmapblk), axis off

    figure;
    histogram(psum(:),100)
    figure;
    title("Patch sum")

    imagesc(p2sum,[0,a*b*limMax^2])
    axis image, colormap(myposmapblk), axis off
    figure;
    title("Patch^2 sum")

    histogram(p2sum(:),100)
    figure;

    imagesc(ptsum,[0,a*b*limMax^2/2])
    axis image, colormap(myposmapblk), axis off
    figure;
    histogram(ptsum,100)
    title("Patch*template sum")
    
    figure;
    imagesc(O,[-1,1])
    axis image, colormap(myposnegmapblk), axis off
    
    drawRect(a, b, indx, indy, [1,1,0]);
end

end
