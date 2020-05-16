class Menu
{
  
  int selected;
  
  Menu()
  {
    selected = 0;  
  }
  
  void OnUpdate()
  {
    if(W_held || S_held || Space_held)
      changeSelection();
  }
  
  void OnDraw()
  {
    drawMenu();
    selectItem(selected);
    
  }
  
  void drawMenu()
  {
    textAlign(CENTER);
      fill(255);
      textSize(30);
      text("Resume", width/2, height*0.4);
      text("FullScreen", width/2, height*0.5);
      text("Exit", width/2, height*0.6);
  }
  
  void selectItem(int i)
  {
    switch(abs(i%3))
    {
      case 0:
        fill(255,255,0);
        text("Resume", width/2, height*0.4);
        flashRectangle(0.4);
       if(Space_held)
         gameState = GAMESTATE.PLAYING;
       break;
  
      case 1:
       fill(255,255,0);
       text("FullScreen", width/2, height*0.5);
       flashRectangle(0.5);
       if(Space_held)
         fullScreen();
       break;
       
      case 2:
       fill(255,255,0);
       text("Exit", width/2, height*0.6);
       flashRectangle(0.6);
       if(Space_held)
         exit();
       break;
    }
  }
    
  void changeSelection()
  {
    if(W_held)
    {
    selected-=1;
    delay(100);
    return;
    }
    
    else if(S_held)
    {
    selected+=1;
    delay(100);
    print(selected);
    return;
    }
  }
  
  void flashRectangle(float i)
  {
    if(millis()%1000 <= 500)
        {
          rectMode(CENTER);
          fill(255,20);
          rect(width/2,height*i,160,80);
        }
  }


}
