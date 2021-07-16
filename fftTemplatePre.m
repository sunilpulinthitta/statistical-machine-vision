function [Sx, Varx, ftt1fill, fttfill] = fftTemplatePre(template, ny, nx)

    [a,b]=size(template);
    % precompute kernel sum(x), sum(x^2), and var(x)
    Sx=sum(template(:)); 
    Sx2=sum(template(:).^2);
    Varx=(Sx2-Sx^2/(a*b))/(a*b-1);

    % generate a kernel of ones the same size as template
    tones=ones(a,b);

    % place ones template at the center of an image of zeros
    tonesfill=zeros(ny,nx);
    tonesfill(ny/2-a/2+1:ny/2+a/2,...
        nx/2-b/2+1:nx/2+b/2)=tones;

    % calculate the FFT of the centered kernel of ones
    ftt1fill=fftshift(fft2(fftshift(tonesfill)));

    % place the template at the center of an image of zeros
    tfill=zeros(ny,nx); indx=(nx/2)+1; indy=(ny/2)+1;
    tfill(ny/2-a/2+1:ny/2+a/2,...
        nx/2-b/2+1:nx/2+b/2)=template;

    % calculate the FFT of the centered template
    fttfill=fftshift(fft2(fftshift(tfill)));
end