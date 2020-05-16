class Menu
{
  
  int selected, menuState;
  //StringList mainMenu, screenMenu;
  
  Menu()
  {
    //Selected keeps track of which menu item is selected with the modulus operator
    selected = 0;  
    //MenuState is used to swap between inbuilt menus
    menuState = 0;
 
  }
  
  void OnUpdate()
  {
    if(W_held || S_held || Space_held)
      changeSelection();
  }
  
  void OnDraw()
  {
    switch(menuState)
    { 
      case 0:
        drawMainMenu();
        selectMainItem(selected);
        break;
      case 1:
        drawScreenMenu();
        selectScreenItem(selected);
      break;
      case 2:
        drawVolumeMenu();
        selectVolumeItem(selected);
    }
  }
  
  //This function draws the menu that will be presented first.
  void drawMainMenu()
  {
    textAlign(CENTER,CENTER);
      fill(255);
      textSize(30);
      text("Resume", width/2, height*0.4);
      text("Screen Size", width/2, height*0.5);
      text("Volume", width/2, height*0.6);
      text("Exit", width/2, height*0.7);
  }
  
   //This function shows which menu item is selected and processes 
  void selectMainItem(int i)
  {
    switch(abs(i%4))
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
       text("Screen Size", width/2, height*0.5);
       flashRectangle(0.5);
       if(Space_held)
       {
         menuState = 1;
         selected = 0;  
       }
       delay(100);
       break;
       
      case 2:
        fill(255,255,0);
        text("Volume", width/2, height*0.6);
        flashRectangle(0.6);
        if(Space_held)
        {
          menuState = 2;
          selected = 0;
        }
        delay(100);
        break;
       
      case 3:

       fill(255,255,0);
       text("Exit", width/2, height*0.7);
       flashRectangle(0.7);
       if(Space_held)
         exit();
       break;
       
    }
  }
  
  //This function should only appear after the second option has been selected from main menu
   void drawScreenMenu()
  {
    textAlign(CENTER,CENTER);
      fill(255);
      textSize(30);
      text("Back", width/2, height*0.4);
      text("500,500", width/2, height*0.5);
      text("Full Screen", width/2, height*0.6);
  }
  
  void selectScreenItem(int i)
  {
    switch(abs(i%3))
    {
      case 0:
        fill(255,255,0);
        text("Back", width/2, height*0.4);
        flashRectangle(0.4);
       if(Space_held)
       {
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
  
      case 1:
       fill(255,255,0);
       text("500,500", width/2, height*0.5);
       flashRectangle(0.5);
       if(Space_held)
       {
         surface.setSize(500,500);
         surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
       
      case 2:
       fill(255,255,0);
       text("FullScreen", width/2, height*0.6);
       flashRectangle(0.6);
       if(Space_held)
       {
         surface.setSize(displayWidth, displayHeight);
         surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
    }
  }
  
  //This menu should only appear if "volume" is accessed
  void drawVolumeMenu()
  {
    textAlign(CENTER,CENTER);
      fill(255);
      textSize(30);
      text("Back", width/2, height*0.4);
      text("Off", width/2, height*0.5);
      text("Low", width/2, height*0.6);
      text("Medium",width/2, height*0.7);
      text("High", width/2, height*0.8);
  }
  
  void selectVolumeItem(int i)
  {
    switch(abs(i%5))
    {
      case 0:
        fill(255,255,0);
        text("Back", width/2, height*0.4);
        flashRectangle(0.4);
       if(Space_held)
       {
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
  
      case 1:
       fill(255,255,0);
       text("Off", width/2, height*0.5);
       flashRectangle(0.5);
       if(Space_held)
       {
         volume.volume(0);
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
       
      case 2:
       fill(255,255,0);
       text("Low", width/2, height*0.6);
       flashRectangle(0.6);
       if(Space_held)
       {
         volume.volume(0.1);
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
       
       case 3:
       fill(255,255,0);
       text("Medium", width/2, height*0.7);
       flashRectangle(0.7);
       if(Space_held)
       {
         volume.volume(0.5);
         menuState = 0;
         selected = 0;
       }
       delay(100);
       break;
       
       case 4:
       fill(255,255,0);
       text("High", width/2, height*0.8);
       flashRectangle(0.8);
       if(Space_held)
       {
         volume.volume(1);
         menuState = 0;
         selected = 0;
       }
       delay(100);
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
          rect(width/2,height*i,200,60);
        }
  }


}
