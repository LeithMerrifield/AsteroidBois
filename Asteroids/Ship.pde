/*
  Auther: Nathan, Harrison Liddell, Leith Merrifield 
  Description: Class for each projectile
*/

class Ship
{
  int m_currentHealth, m_maxHealth;
  int m_currentFuel,m_maxFuel;
  PImage playerShip, playerShipThrust;
  PVector m_location, m_velocity, m_accelaration;
  float m_rotation, m_rotation_speed, m_thrust_force;
  ArrayList<Projectile> m_bullets = new ArrayList<Projectile>();

  Ship(int health)
  {
    playerShip= loadImage(dataPath("Textures\\Ship\\ShipIdle.png"));
    playerShipThrust = loadImage(dataPath("Textures\\Ship\\ShipFull.png"));
    playerShip.resize(60,96);
    playerShipThrust.resize(60,96);
    m_location = new PVector(0,0);
    m_velocity = new PVector(0,0);
    m_accelaration = new PVector(0,0);
    m_rotation = 0;
    m_rotation_speed = 0.05;
    m_thrust_force = 0.07;
    m_maxFuel = 1000;
    m_currentFuel = m_maxFuel;
    m_currentHealth = health;
    m_maxHealth = health;
  }
  
  // changes the rotation and accelaration with key inputs.
  void OnUpdate() 
  {
    if(A_held) 
    { 
      m_rotation -= m_rotation_speed;
    }
    if(D_held) 
    { 
      m_rotation += m_rotation_speed;
    }
    
    // accelarates the rocket in the direction its facing if w is held
    if(W_held && m_currentFuel > 0) 
    {
      m_accelaration.x = m_thrust_force*sin(m_rotation);
      m_accelaration.y = -m_thrust_force*cos(m_rotation);
      m_currentFuel -= 1;
    } 
    else 
    {
      m_accelaration.x = 0;
      m_accelaration.y = 0;
    }
    
    if(W_held && !thrusterSound.isPlaying() && m_currentFuel > 0) 
    {
      thrusterSound.play();
    }
    if(!W_held || m_currentFuel == 0) 
    {
      thrusterSound.stop();
    }
    
    if(Space_held && !GunFire.isPlaying()) 
    {
      GunFire.play();
      m_bullets.add(new Projectile(m_location.x,m_location.y,m_rotation));
    }
    // these loop the player around to the other side of the screen if they hit a side.
    if(abs(m_location.x) > (playerShip.width + width)/2) 
    {
      m_location.x = -m_location.x;
    }
    if(abs(m_location.y) > (playerShip.width + height)/2) 
    {
      m_location.y = -m_location.y;
    }
    
    for(Projectile bullet : m_bullets)
    {
      bullet.OnUpdate();
    }
    
    for(int i = 0; i < m_bullets.size(); i++)
    {
      Projectile bullet = m_bullets.get(i);
      if((abs(bullet.m_position.x) > (playerShip.width + width) / 2) || (abs(bullet.m_position.y) > (playerShip.height + height) / 2))
      {
        bullet.m_flagToDestroy = true;
      }
      if(bullet.m_flagToDestroy) 
      {
        m_bullets.remove(i);
      }
    }
  }
  
  void OnDraw() 
  { // the pushing and popping of matrix allows it to rotate around the rocket.
    pushMatrix();
    for(Projectile bullet : m_bullets)
    {
      bullet.OnDraw();
    }
    translate(m_location.x+width/2, m_location.y+height/2);
    rotate(m_rotation);
    if(W_held && m_currentFuel > 0) 
    {
      image(playerShipThrust, -playerShip.width/2, -playerShip.height/2);
    }
    else 
    {
      image(playerShip, -playerShip.width/2, -playerShip.height/2);
    }

    popMatrix();
    
    m_velocity.add(m_accelaration);
    m_location.add(m_velocity);
    fill(255- m_currentFuel*255/1000, m_currentFuel*255/1000, 0); 
    rect(10, 10, m_currentFuel/2, 10);
    fill(255,255,255);
  }
}
