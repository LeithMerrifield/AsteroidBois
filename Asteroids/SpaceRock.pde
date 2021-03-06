/*
  Author: Leith Merrifield 
  Description: Class for each Asteroid
*/

class Asteroid
{
  int m_minSize = 50;
  int m_maxSize = 100;
  int m_spawnOffset = 50;
  
  PVector m_position = new PVector();
  PVector m_direction = new PVector();
  PVector m_velocity = new PVector();
  
  boolean m_wrapRock = false;
  float m_speed = .7f;
  PImage m_asteroidImage;
  boolean m_flagToDestroy = false;
  boolean m_isPlayerOn = false;
  
  boolean m_skip = false;
  
  // basic constructor that picks a random image from the directory
  public Asteroid()
  {
    File folder = new File(dataPath("Rocks\\"));
    String[] filenames = folder.list();
    String path = filenames[(int)random(0,filenames.length)];
    PImage newRock = loadImage(dataPath("Rocks\\" + path));
    int size = (int)random(m_minSize,m_maxSize);
    
    newRock.resize(size,size);
    m_asteroidImage = newRock;
    SetRandomSpawn();
    GetDirection();
  }
  
  // constructor override that copies the properties of an existing asteroid
  public Asteroid(float speed, int size, PImage image,PVector position)
  {
    m_asteroidImage = new PImage(image.getImage());
    m_position = new PVector(position.x,position.y);
    m_asteroidImage.resize(size,size);
    m_speed = speed;
    RandomDirection();
    m_skip = true;
  }
  
  void OnUpdate()
  {
    if(isPlaying)
    {
      Movement();
       
      // used so that the asteroids can travel into the screen before wrapping
      if((m_position.x > 0 && m_position.x < width) && (m_position.y > 0 && m_position.y < height))
      {
        m_wrapRock = true;
      }
      
      if(m_wrapRock)
      {
        ScreenWrap();
      }
    }
  }

  void OnDraw()
  {    
    
    image(m_asteroidImage,m_position.x,m_position.y);
    
    if(debugLines)
    {
      stroke(255);
      line(m_position.x,m_position.y,m_position.x + m_asteroidImage.width,m_position.y);
      line(m_position.x + m_asteroidImage.width,m_position.y,m_position.x + m_asteroidImage.width,m_position.y + m_asteroidImage.height);
      line(m_position.x + m_asteroidImage.width,m_position.y + m_asteroidImage.height,m_position.x,m_position.y + m_asteroidImage.height);
      line(m_position.x,m_position.y + m_asteroidImage.height,m_position.x,m_position.y);
    }
  }
  
  // if an asteroid travels off screen than transfer it to the other side
  void ScreenWrap()
  {
    if(m_position.x > width + m_asteroidImage.width) 
    {
      m_position.x = -m_asteroidImage.width;
    }
    if(m_position.y > height + m_asteroidImage.height) 
    {
      m_position.y = -m_asteroidImage.height;
    }
    if(m_position.y < -m_asteroidImage.height) 
    {
      m_position.y = height + m_asteroidImage.height;
    }
    if(m_position.x < -m_asteroidImage.width) 
    {
      m_position.x = width + m_asteroidImage.width;
    }
  }
  
  // basic movement
  void Movement()
  {
    m_velocity.add(m_direction);
    m_velocity.mult(m_speed);
    m_position.add(m_velocity);
  }
  
  // Will spawn asteroids outside of the screen by the offset
  void SetRandomSpawn()
  {
   if(random(0,50) > 25)
   {
     m_position.x = 0 - m_spawnOffset;
     m_position.y = random(0,height);
   }
   else
   {
     m_position.x = random(0,width);
     m_position.y = 0 - m_spawnOffset;
   }
   
   if(random(0,50) > 25 && m_position.x < 0)
   {
     m_position.x = width + m_spawnOffset;
   }
   if(random(0,50) > 25 && m_position.y < 0)
   {
     m_position.y = height + m_spawnOffset;
   }
  }
  
  // creates a direction based on current direction
  // somewhat random
  void GetDirection()
  {
    if(m_position.x > width)
    {
      m_direction.y = random(0,height);
      m_direction.x = 0;
    }
    else if(m_position.x < 0)
    {
      m_direction.y = random(0,height);
      m_direction.x = width;
    }
    else if(m_position.y > height)
    {
      m_direction.x = random(0,width);
      m_direction.y = 0;
    }
    else if(m_position.y < 0)
    {
      m_direction.x = random(0,width);
      m_direction.y = height;
    }
    m_direction = PVector.sub(m_direction,m_position);
    m_direction.normalize();
  }
  
  // creates a random direction around the rock
  void RandomDirection()
  {
    m_direction.x = random(0,width);
    m_direction.y = random(0,height);
    m_direction = PVector.sub(m_direction,m_position);
    m_direction.normalize();
  }
  
  // used to check if the passed in bulletlist collides with any rock
  boolean CheckBulletCollision(ArrayList<Projectile> bulletList)
  {
    for(Projectile bullet : bulletList)
    {
      if(bullet.m_position.x + width/2 < m_position.x + m_asteroidImage.width &&
         bullet.m_position.x + width/2 + bullet.m_size > m_position.x &&
         bullet.m_position.y + height/2 < m_position.y + m_asteroidImage.height &&
         bullet.m_position.y + height/2 + bullet.m_size > m_position.y)
         {
           bullet.m_flagToDestroy = true;
           return true;
         }
    }
    return false;
  }
}
