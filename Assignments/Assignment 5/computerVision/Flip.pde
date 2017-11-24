//Deprecated (causing screen flicker)

void flip(){
  PImage buffer = new PImage(video.width, video.height);
  for(int i=0; i<video.pixels.length; i++){
     buffer.pixels[i] = video.pixels[i]; 
  }
  for(int x=0; x<video.width; x++){
    for(int y=0; y<video.height; y++){
      video.pixels[y*video.width+x] = buffer.pixels[y*video.width+(video.width-x-1)];
    }
  }
}