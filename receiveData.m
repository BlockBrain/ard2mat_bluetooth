function receiveData(varargin)
    p = inputParser();
	p.addParameter('mess','1',@ischar);
	p.parse(varargin{:});
	s = p.Results
    global test;
    global KEY_IS_PRESSED
    KEY_IS_PRESSED = 0;

    if(s.mess == '1')
        %echoudp('on',4210)
        test = udp('192.168.0.34',4210)
        %fopen(test)
        %fwrite(test,'1')
        %pause
        h = animatedline;
        axis([0 4*pi -1 1])
        x = linspace(0,4*pi,2000);
        gcf
        set(gcf, 'KeyPressFcn', @myKeyPressFcn)
        for k = 1:length(x)
            y = sin(x(k));
            addpoints(h,x(k),y);
            drawnow
            if KEY_IS_PRESSED
                break
            end
        end
        disp('loop ended')

        
        A = fread(test)

    elseif(s.mess == '3')
        echoudp('OFF')
    end



function myKeyPressFcn(hObject, event)
global KEY_IS_PRESSED
KEY_IS_PRESSED  = 1;
disp('key is pressed') 