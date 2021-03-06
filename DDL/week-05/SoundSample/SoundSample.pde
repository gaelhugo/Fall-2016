import processing.sound.*;

SoundFile soundfile;
SawOsc saw;

void setup() {
    size(640,360);
    background(255);
        
    // Create the sine oscillator.
    saw = new SawOsc(this);
    saw.amp(0.1);
    
    //Load a soundfile
    soundfile = new SoundFile(this, "test.mp3");
    // Play the file in a loop
    soundfile.loop();
}      


void draw() {
  // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback 
  // speed 2 is an octave up 0.5 is an octave down.
  soundfile.rate(map(mouseX, 0, width, 0.25, 4.0)); 
  
  // Map mouseY from 0.2 to 1.0 for amplitude  
  soundfile.amp(map(mouseY, 0, width, 0.2, 1.0)); 
 
  // Map mouseY from -1.0 to 1.0 for left to right 
  //soundfile.pan(map(mouseY, 0, width, -1.0, 1.0));  
}

void mouseClicked() {
  
  float time = map(mouseX, 0, width, 0, soundfile.duration());
  soundfile.jump(time);
}

void keyPressed() {
    saw.play(); 
}

void keyReleased() {
    saw.stop(); 
}