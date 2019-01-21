# Pegasus
## Authors
2000:
Andrew Shilliday

## About
This program reads existential graph proofs and displays a visual step by step demonstration of that proof in a smooth, animated style.  The user has various media controls which will allows the user to play, pause, fast forward, and rewind the animation just as if it were a movie.   Pegasus has Pan and Zoom options which allow the user to zoom in on a specific part of the graph during animation.

>  To run the program, execute
	(pegasus)

> Open a file, use the leftmost button in the toolbar.

> To Pan the animation around, click and hold the left mouse button

> To Zoom, click and hold the right mouse button, or press shift and use the left mouse button                                                             ;

> To start the animation, press on of the animation controls in the toolbar

COMPATABILITY:
Pegasus was written in LispWorks for Windows, and it's intended platform in win32, it has been tested to work on Darwin, but do to compatability issues with lispworks, a few features had to be dropped.  In win32, when the animation is in progress, you may pan and zoom the window with no problem, in Darwin, however, paning or zooming causes the animation to cease, and the user must press play once the graph is in the desired position to resume the animation.
