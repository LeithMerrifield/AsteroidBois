class Ship
{
  int m_health;
  PImage playerShip;
  PVector m_position;
  PVector m_speed; 
  PVector m_direction;
  float m_drag;
  int m_rotation;
  int m_orientation;
  int inBox;
  boolean  shipFaceRight, shipFaceUp; 
  
  Ship(int m_health)
  {
    playerShip= loadImage("ShipIdle.png");
    playerShip.resize(60,96);
    m_position= new PVector(width/2,height/2);
    m_speed= new PVector(0,0);
    m_drag = 0.85;
    inBox = 1;
    shipFaceRight = false;
    m_rotation = 0;
  }
  
  void OnUpdate()
  {
    //Basic ship collision with the screen
    shipBorderCollision();
    
    //Checks and updates ship speed based on keys
    adjustSpeed();
     
    //Change location according to speed
    m_position.add(m_speed);
    
    //Speed is lowered thanks to drag
    m_speed.mult(m_drag);
    
  }
  
  void OnDraw()
  {
    shipRotation(m_rotation);
    image(playerShip,m_position.x - (playerShip.width/2) ,m_position.y - (playerShip.height/2)); 
  }
  
  
  //Other Functions
  //This function is responsible for both controlling the player ship through key inputs and for changing the images used for the ship according to speed
  void adjustSpeed()
  {
        if(keyW)
       {
        m_speed.add(0,-0.5);
       }
       if(keyA)
       {
         m_rotation -=5;
        
       }
       if(keyD)
       {
         m_rotation += 5;
         
       }
       if(keyS)
       {
         m_speed.add(0,0.5);
       }  
       
       speedRotation(m_rotation);
     
      //Below changes the image of the ship if a certain speed is reached 
      if(abs(m_speed.x)>3.5 || abs(m_speed.y) > 3.5)
      {
        playerShip=loadImage("ShipFull.png");
        thrusterSound.play();
      }
      
      else if(abs(m_speed.x) >=0.5 || abs(m_speed.y) >= 0.5)
      {
        playerShip=loadImage("ShipMid.png");
        thrusterSound.play();
      }
      
      else
      {
        playerShip = loadImage("ShipIdle.png");
      }
      
      playerShip.resize(60,96);
  }
  
  
  //A simple function to set the ships health
  void SetHealth(int newHealth)
  {
    m_health = newHealth;
  }
  
  
  //A function to both detect and 'bounce' the ship away from the borders of the screen.
  void shipBorderCollision()
  {
     if(m_position.x+(playerShip.width*0.4) >= width || m_position.x-(playerShip.width*0.4) <0 || m_position.y-(playerShip.height*0.5) <= 0 || m_position.y+(playerShip.height*0.3) >= height)
    {
     
      m_speed.mult(-m_drag);
    }
    else inBox = 1;
    
    //This ensures a 'hard' border that the ship cannot cross
    if(m_position.x+(playerShip.width*0.4) >= width)
      m_position.x = width-(playerShip.width*0.4);
    if(m_position.x-(playerShip.width*0.4) < 0)
      m_position.x = 0+ (playerShip.width*0.4);
    if(m_position.y-(playerShip.height*0.5) <= 0)
      m_position.y = 0 +(playerShip.height*0.5);
    if(m_position.y+(playerShip.height*0.3) >= height)
      m_position.y = height-(playerShip.height*0.3);
  }
  
  //This function rotates the ship around its own axis
  void shipRotation(int rotation)
  {
    
    translate(m_position.x,m_position.y);
    rotate(radians(rotation));
    translate(-m_position.x,-m_position.y);
    
    
  }
  
  //This function is used to change the direction the ship is travelling
  void speedRotation(int rotation)
  {  
  //  translate(m_position.x,m_position.y);
    m_speed.rotate(radians(rotation));
   // translate(-m_position.x,-m_position.y);
  }
  
  
  
  
  
  

}
