/*
  Auther: Harrison Liddell
  Description: Main file for the menu state
*/

class Menu
{
  
  int selected, menuState, keyDelayTime;
  //StringList mainMenu, screenMenu;
  
  Menu()
  {
    //Selected keeps track of which menu item is selected with the modulus operator
    selected = 0;  
    //MenuState is used to swap between inbuilt menus
    menuState = 0;
    //keyDelayTime is the delay between keypresses
    keyDelayTime = 75;
 
  }
  
  void OnUpdate()
  {
    if(W_held || S_held)
      changeSelection();
  }
  
  void OnDraw()
  {
    fill(255);
    textSize(60);
    text("ASTEROIDS", width/2, height*0.2);
    
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
        break;
      case 3:
      drawCredits();
    
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
      text("Credits", width/2, height*0.7);
      text("Exit", width/2, height*0.8);
  }
  
   //This function shows which menu item is selected and processes its selection
  void selectMainItem(int i)
  {
    
    switch(abs(i)%5)
    {
      case 0:
        fill(255,255,0);
        text("Resume", width/2, height*0.4);
        flashRectangle(0.4);
       if(Space_held)
         gameState = GAMESTATE.PLAYING;
       delay(keyDelayTime);
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
       delay(keyDelayTime);
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
        delay(keyDelayTime);
        break;
      
       case 3:
       fill(255,255,0);
       text("Credits", width/2, height*0.7);
       flashRectangle(0.7);
       if(Space_held)
         menuState = 3;
       delay(keyDelayTime);
       break;    
       
      case 4:

       fill(255,255,0);
       text("Exit", width/2, height*0.8);
       flashRectangle(0.8);
       if(Space_held)
         exit();
       delay(keyDelayTime);
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
      text("750,750", width/2, height*0.6);
      text("1000,1000", width/2, height*0.7);
      text("Full Screen", width/2, height*0.8);
  }
  
  void selectScreenItem(int i)
  {
    switch(abs(i)%5)
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
       delay(keyDelayTime);
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
       delay(keyDelayTime);
       break;
       
       case 2:
       fill(255,255,0);
       text("750,750", width/2, height*0.6);
       flashRectangle(0.6);
       if(Space_held)
       {
         surface.setSize(750,750);
         surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
         menuState = 0;
         selected = 0;
       }
       delay(keyDelayTime);
       break;
       
       case 3:
       fill(255,255,0);
       text("1000,1000", width/2, height*0.7);
       flashRectangle(0.7);
       if(Space_held)
       {
         surface.setSize(1000,1000);
         surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
         menuState = 0;
         selected = 0;
       }
       delay(keyDelayTime);
       break;
       
      case 4:
       fill(255,255,0);
       text("Full Screen", width/2, height*0.8);
       flashRectangle(0.8);
       if(Space_held)
       {
         surface.setSize(displayWidth, displayHeight);
         surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
         menuState = 0;
         selected = 0;
       }
       delay(keyDelayTime);
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
    switch(abs(i)%5)
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
       delay(keyDelayTime);
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
       delay(keyDelayTime);
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
       delay(keyDelayTime);
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
       delay(keyDelayTime);
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
       delay(keyDelayTime);
       break;
    }
  }
  
  void drawCredits()
  {
    textSize(30);
    
    text("Asteoids Game Created By:",width/2, height*0.4);
    text("Leith Merrifield", width/2, height*0.5);
    text("Nat Edmonds", width/2, height*0.6);
    text("Harrison Liddell", width/2, height*0.7);
    fill(255,255,0);
    text("Back", width/2, height*0.8);
    flashRectangle(0.8);
    if(Space_held == true)
    { 
      menuState = 0;
      selected = 0;
     }
  }
  
 
 //This function is used to change what the menyu is currently hgihlighting
 void changeSelection()
  {
    if(W_held)
    {
      if(selected == 0)
        selected = 5;
        
      selected-=1;
        
    //print(selected);
    return;
    }
    
    else if(S_held)
    {
        selected+=1;
    //print(selected);
    return;
    }
  }
  
  
  //This function creates a rectangular box around the height its given (i)
  void flashRectangle(float i)
  {
    if(millis()%250 <= 125)
        {
          rectMode(CENTER);
          fill(255,0);
          rect(width/2,height*i,200,60);
          fill(255,0);
          rect(width/2, height*i,195,55);
        }
  }


}
