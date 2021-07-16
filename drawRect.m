function drawRect(xlen, ylen, x, y, color)
line([0.5+x-ylen/2,0.5+x-ylen/2],[0.5+y-xlen/2,0.5+y+xlen/2],'Color',color,'LineWidth',1.0)
line([0.5+x+ylen/2,0.5+x+ylen/2],[0.5+y-xlen/2,0.5+y+xlen/2],'Color',color,'LineWidth',1.0)
line([0.5+x-ylen/2,0.5+x+ylen/2],[0.5+y-xlen/2,0.5+y-xlen/2],'Color',color,'LineWidth',1.0)
line([0.5+x-ylen/2,0.5+x+ylen/2],[0.5+y+xlen/2,0.5+y+xlen/2],'Color',color,'LineWidth',1.0)
end