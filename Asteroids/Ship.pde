class Ship
{
  int m_health, projectileSize;
  PImage playerShip, playerShipThrust;
  PVector m_location, m_velocity, m_accelaration;
  float m_rotation, m_rotation_speed, m_thrust_force, bullet_speed;
  FloatList projectiley, projectileyspeed, projectilex, projectilexspeed;

  
  Ship(int m_health)
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
    projectileSize = 3;
    bullet_speed = 10;
    projectiley = new FloatList();
    projectileyspeed = new FloatList();
    projectilex = new FloatList();
    projectilexspeed = new FloatList();
  }
  
  //A simple function to set the ships health
  void SetHealth(int newHealth)
  {
    m_health = newHealth;
  }
  
  // changes the rotation and accelaration with key inputs.
  void OnUpdate() {
    if(A_held) { 
      m_rotation -= m_rotation_speed;
    }
    if(D_held) { 
      m_rotation += m_rotation_speed;
    }
    // accelarates the rocket in the direction its facing if w is held
    if(W_held) {
      m_accelaration.x = m_thrust_force*sin(m_rotation);
      m_accelaration.y = -m_thrust_force*cos(m_rotation);
    } else {
      m_accelaration.x = 0;
      m_accelaration.y = 0;
    }
    if(W_held && !thrusterSound.isPlaying()) {
      thrusterSound.play();
    }
    if(!W_held) {
      thrusterSound.stop();
    }
    if(Space_held && !GunFire.isPlaying()) {
      GunFire.play();
      projectilex.append(m_location.x);
      projectilexspeed.append(bullet_speed*sin(m_rotation));
      projectiley.append(m_location.y);
      projectileyspeed.append(bullet_speed*-cos(m_rotation));
    }
    // these loop the player around to the other side of the screen if they hit a side.
    if(abs(m_location.x) > (playerShip.width + width)/2) {
      m_location.x = -m_location.x;
    }
    if(abs(m_location.y) > (playerShip.width + height)/2) {
      m_location.y = -m_location.y;
    }
  }
  
  void OnDraw() { // the pushing and popping of matrix allows it to rotate around the rocket.
    pushMatrix();
    for(int i = 0; i < projectilex.size(); i++) { 
        circle(projectilex.get(i)+width/2, projectiley.get(i)+height/2, projectileSize);
        projectilex.add(i, projectilexspeed.get(i));
        projectiley.add(i, projectileyspeed.get(i));
    }
    translate(m_location.x+width/2, m_location.y+height/2);
    rotate(m_rotation);
    if(W_held) {
      image(playerShipThrust, -playerShip.width/2, -playerShip.height/2);
    } else {
      image(playerShip, -playerShip.width/2, -playerShip.height/2);
    }
    popMatrix();
    m_velocity.add(m_accelaration);
    m_location.add(m_velocity);
  }
}
