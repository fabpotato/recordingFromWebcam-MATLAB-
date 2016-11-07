 vid1 = videoinput('winvideo',1, 'YUY2_320x240');
     % vid2 = videoinput('winvideo',2, 'YUY2_320x240');
      set(vid1, 'FramesPerTrigger', 100);
      %set(vid2, 'FramesPerTrigger', Inf);
      set(vid1, 'ReturnedColorspace', 'rgb');
     % set(vid2, 'ReturnedColorspace', '');
      vid1.FrameGrabInterval = 1;
      %vid2.FrameGrabInterval = 1;% distance between captured frames 
      start(vid1)
      %start(vid2)
      aviObject1 = avifile('rec1.avi');   % Create a new AVI file
      %aviObject2=avifile('v8.avi')
      for iFrame = 1:900                    % Capture 900 frames
         % ...
         % You would capture a single image I from your webcam here
         % ...
         subplot(1,2,1);
         I=getsnapshot(vid1);
         imshow(I);
         %subplot(1,2,2);
         %J=getsnapshot(vid2);
         %imshow(J);
         F = im2frame(I);                    % Convert I to a movie frame
         %G = im2frame(J);
         aviObject1 = addframe(aviObject1,F);  % Add the frame to the AVI file
         %aviObject2 = addframe(aviObject2,G);
      end
      aviObject1 = close(aviObject1);         % Close the AVI file
      %aviObject2 = close(aviObject2);
      stop(vid1);
      %stop(vid2);
      %flushdata(vid1);
      %flushdata(vid2);
      