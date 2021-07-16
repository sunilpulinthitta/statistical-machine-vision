function [tf, indx, indy, flag] = fftTemplateMatch(Im, t, Sx, Varx, fttfill, ftt1fill, boxColor, tf)
    flag = 0;
    [a,b]=size(t);
    % calculate the FFT of the image scene
    ftI=fftshift(fft2(fftshift(squeeze(Im))));
    % calculate the FFT of the image square
    ftI2=fftshift(fft2(fftshift((squeeze(Im).^2))));
    
    % calculate the local sum(y) via FFT
    Sy =real(fftshift(ifft2(fftshift(ftI .*ftt1fill))));
    % calculate the local sum(y^2) via FFT
    Sy2=real(fftshift(ifft2(fftshift(ftI2.*ftt1fill))));
    
    % calculate variance of y
    Vary=(Sy2-(Sy.^2)/(a*b))/(a*b-1);
    % compute sum(xy) between template x and pixels under y
    Sxy=real(fftshift(ifft2(fftshift(ftI.*conj((fttfill))))));
    % compute covariance between template x and pixels under y
    Covxy=(Sxy-(Sx*Sy)/(a*b))/(a*b-1);
    Corxy=Covxy./sqrt((Varx)*(Vary));
    
    % find max val and indices for box
    maxval=max(max(squeeze(Corxy)));
    [indy,indx]=find(squeeze(Corxy)==maxval);
    
    
    if (maxval>=0.7) % if high correlation place a magenta box around
        flag = 1;
        drawRect(a, b, indx, indy, boxColor)
        
        tf = tf + 1;
        text(indx - a/2, indy - b/2 , string(tf),'Color','blue');
    end

end