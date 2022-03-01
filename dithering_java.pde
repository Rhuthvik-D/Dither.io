
PImage lion;
void setup ()
{
  size(1024, 512);
  lion = loadImage("lion.jpeg");
  lion.filter(GRAY);
  image (lion, 0, 0);
  
}

int index(int x, int y)
{
  return x+y*lion.width;
}

void draw ()
{
  lion.loadPixels();
  for (int y = 0; y< lion.height-1; y++)
  {
    for (int x=1; x<lion.width-1; x++)
    {
      
      color pix = lion.pixels[index(x, y)];

      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);

      int colfac = 4;

      int newR = round(colfac * oldR / 255) * (255/colfac);
      int newG = round(colfac * oldG / 255) * (255/colfac);
      int newB = round(colfac * oldB / 255) * (255/colfac);
      lion.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;

      int index = index(x+1, y  );
      color c = lion.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR *7/16.0;
      g = g + errG *7/16.0;
      b = b + errB *7/16.0 ;
      lion.pixels[index] = color(r, g, b);

      index = index(x-1, y+1);
      c = lion.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *3/16.0;
      g = g + errG *3/16.0;
      b = b + errB *3/16.0 ;
      lion.pixels[index] = color(r, g, b);

      index = index(x, y+1);
      c = lion.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *5/16.0;
      g = g + errG *5/16.0;
      b = b + errB *5/16.0;
      lion.pixels[index] = color(r, g, b);

      index = index(x+1, y+1);
      c = lion.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *1/16.0;
      g = g + errG *1/16.0;
      b = b + errB *1/16.0 ;
      lion.pixels[index] = color(r, g, b);
    }
  }
  lion.updatePixels();
  image(lion, 512, 0);
  save("lionbw.jpeg");
}
