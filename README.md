Stop the music!
===============

**Dependencies:** [xdotool](https://github.com/jordansissel/xdotool)

Tiny bash script to check whether I'm at my computer or not by monitoring mouse pointer movement, and accordingly pause my music. (and resume it when I'm back)

To run:
```sh
$ bash pointer_movement.sh
```

Change bash to zsh or whatever flavor your shell happens to be of.

#### Parameters:
- **$dist_thresh**: This is the distance threshold value for the (square of the euclidean distance) mouse pointer. Define it according to how much movement you want to classify as natural or enforced.
- **$time_thresh**: A more important threshold, set this to determine the time you want the script to wait until it pauses your music. Default has been set to 10 seconds.

## TODO
- Doesn't account scrolling action for now.
