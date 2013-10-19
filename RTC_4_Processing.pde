/**  Real-Time Clock for Processing - Author:  Joseph (relic) Unik
     Written 10/19/2013    Uses standard Java classes to get the
     system time from the PC, and convert to UTC time, which can
     be removed to show local time.  If your PC clock is set by an
     internet server, this keeps perfect time.  Great for generating
     timestamps.\/
*/


import java.util.Calendar;
import java.util.TimeZone;

Calendar c;
PFont font;
String timestamp;

void setup() 
{
  size(400, 300);  
  background(0);
  font = createFont("Arial", 28);
  textFont(font);
}

void time()
{
  int d;                                 // Getting data for timestamp
  int m;  
  int y;   
  int hr;    
  int min;  
  int sec;
  
  c = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
  
  m = (c.get(Calendar.MONTH));
  d = (c.get(Calendar.DAY_OF_MONTH));
  y = (c.get(Calendar.YEAR));
  hr = (c.get(Calendar.HOUR_OF_DAY));
  min = (c.get(Calendar.MINUTE));
  sec = (c.get(Calendar.SECOND));
  
  m ++;                                 // Month zero indexed
    
  if (m >=13)  {
    m = 1;  }
    
  if (hr >= 24)  {
    hr = 0;  }
    
  String day = nf(d, 2);
  String mon = nf(m, 2);
  String yr = nf(y, 4);
  String hour = nf(hr, 2);
  String minute = nf(min, 2);
  String second = nf(sec, 2);
  
  timestamp = mon + "/" + day + "/" + yr + "  -  " + hour + ":" + minute + ":" + second + "  UTC";

  fill(255, 255, 255);
  textAlign(CENTER);
  text(timestamp, width/2, height/2);
  textAlign(LEFT);
  return;
}

void draw()
{
  background(0);
  time();
  delay(200);
}
